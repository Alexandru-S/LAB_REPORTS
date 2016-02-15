#include <iostream>
#include <unistd.h>
#include <cstdlib>
#include <netdb.h>
#include <stdio.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <netinet/in.h>
#include <cerrno>
#include <cstring>
#include <fstream>
#include <time.h>
#include <sys/uio.h>

#define BUFLEN 1024
#define PORT 5555
using namespace std;

/*8 bytes*/
/*2 bytes for header - sequence number*/
/*4 bytes for packet*/
/*2 bytes for trailer - crc*/ 


/* taken from the internet - src2
 the alorithm of calculating the 'checksum'*/
 /* polynomial*/
unsigned short crc16(unsigned char* data_p, unsigned char length){
    unsigned char x;
    unsigned short crc = 0xFFFF;

    while (length--)
    {
        x = crc >> 8 ^ *data_p++;
        x ^= x>>4;
        crc = (crc << 8) ^ ((unsigned short)(x << 12)) ^ ((unsigned short)(x <<5)) ^ ((unsigned short)x);
    }
    return crc;
}

/* wipes out control sum with the probability of 5%*/
/* corrupt treiler*/
char Gremlin(char data) 
{
	int num = 0;
	/*spliting it in 20 parts*/
	num = rand()%20; 
	if (num == 1)
	{
		data = ' ';
		cout<<"\n****************************"<< endl;
		cout<<" GREMLIN FUNCTION ACTIVATED"<<endl; 
	 	cout  <<"****************************"<< endl;
	}
	return data;   
}

/*counts bytes in a file*/
long GetFileSize(const char* filename)
{
    long size;
    FILE *f;
 /*opened in a binary format */
 /*r to read*/
 /*b to open in binary*/
    f = fopen(filename, "rb");
    if (f == NULL)
    {
    	return -1;
    }
    fseek(f, 0, SEEK_END);
    size = ftell(f);
    fclose(f);
 
    return size;
}


/*Alphanumeric Random Character Generator*/
int RandGen()  
{
	int num = 0;
	// random sub-range*/
	num = rand()%3;  
 	//range0: numeric*/
	if (num == 0)      
	{
		return (rand()%10)+48;
	}   
	// range1: upper characters
	if (num == 1)       
	{
		return (rand()%26)+65;
	}
	// range2: lower characters
	if (num == 2)        
	{
		return (rand()%26)+97;
	}
}


void server_main()
{	
	cout<<"***************************************"<<endl;
	cout<<"***************UDP_SERVER**************"<<endl;
	cout<<"***************************************"<<endl;
	int sock;
	struct sockaddr_in server_socket;
	struct sockaddr_in client_socket;
	int one=1;
	// declare the 'out' stream
	ofstream out;    
	
	/*******************************************************/
    	/*SOCKET CREATION*/
    	/*******************************************************/
	/*Define socket as UDP*/
	if ((sock = socket(PF_INET, SOCK_DGRAM, IPPROTO_UDP)) < 0)exit(0);
	setsockopt(sock, SOL_SOCKET, SO_REUSEPORT, &one, sizeof(one));
	/*clear memory*/
	memset(&server_socket, 0, sizeof(server_socket));
	/*socket family*/
	server_socket.sin_family = AF_INET;
	/*ip adress*/
	server_socket.sin_addr.s_addr = htonl(INADDR_ANY);
	/*port*/
	server_socket.sin_port = htons(PORT);
	
	if (bind(sock, (struct sockaddr *) &server_socket, sizeof(server_socket)) < 0)
		exit(0);
	/*******************************************************/
	char buffer[BUFLEN];
	int received;
	while (1) 
	{	
	/*******************************************************/
		/*Receives test.txt contents from the client */
	/*******************************************************/
		socklen_t client_len = sizeof(client_socket);
		if ((received = recvfrom(sock, buffer, 255, 0, (struct sockaddr *) &client_socket, &client_len)) < 0) 
		{
			exit(0);
		}
		buffer[received] = '\0';
		cout <<"CLIENT CONNECTION: "<< inet_ntoa(client_socket.sin_addr)<<"\t"<<ntohs(client_socket.sin_port)<<endl;
		//cout <<"PORT: "<< server_socket.sin_port<<endl;
		cout<<"header"<<&client_len<<endl;
		cout<<"SERVER SOCKET: "<<PORT<<endl;
		cout <<"RECEIVED DATA SENT FROM CLIENT: "<< buffer<<endl<<endl;
	/*******************************************************/
	
	/*******************************************************/
		/**SEND A PACKET BACK TO THE CLIENT*/
	/*******************************************************/
		if (sendto(sock, buffer, strlen(buffer), 0, (struct sockaddr *) &client_socket, sizeof(client_socket)) < 0)
		{
			cout<<"error here";
			exit(0);
		}
	/*******************************************************/
	
	/*******************************************************/
		/* open data file*/
    		/*delete contents of file
    		and add new contents*/
    	/*******************************************************/
    		std::ofstream ofs;
		ofs.open("out.txt", std::ofstream::out | std::ofstream::trunc);
		ofs<<buffer;
		ofs.close();
		sleep(3);
	/*******************************************************/
	}
}

void client_main()
{
	int sock, rc;
	long filesize;
	long begin, end;
	int i = 0;
	int one=1;
	struct sockaddr_in server_socket;
	struct sockaddr_in client_socket;
	/*text file being accessed for proj*/
	ifstream myfile ("test.txt");	
	
	cout<<"***************************************"<<endl;
	cout<<"***************UDP_CLIENT**************"<<endl;
	cout<<"***************************************"<<endl;
	/*****************************************************/
	/*First delete previous contents in file*/
	/*****************************************************/
	// declare the 'out' stream
	ofstream out;    
	// try to open data file
    	out.open("test.txt");  
     	// check if opened
    	if(out.fail())              
    	{ 
		cout << "unable to open test.txt" << endl;
		//return 1; 
    	} 
    	/*delete contents of file*/
    	std::ofstream ofs;
	ofs.open("test.txt", std::ofstream::out | std::ofstream::trunc);
	ofs.close();
	/*******************************************************/
	
	/*******************************************************/
	/* Write 1024 random ASCII characters into file*/
	/*******************************************************/
	/*time the randomness*/
    	srand((unsigned)time(0));
    	/* the loop outputs 1024 
    	alphanumeric characters
    	 into the stream*/
	for(int i = 0;i<1024;i++)   
    	{
	// casting from a number to a character
        	out << static_cast<char>(RandGen());           
    	}
    	out.close();
    	system("---DATA FILE HAS BEEN CREATED---\n");
    	/*******************************************************/
    	
    	/*******************************************************/
    	/*SOCKET CREATION*/
    	/*******************************************************/
	if ((sock = socket(PF_INET, SOCK_DGRAM, IPPROTO_UDP)) < 0)
	{
		exit(0);
	}
	setsockopt(sock, SOL_SOCKET, SO_BROADCAST, &one, sizeof(one));
	/*clear memory*/
	memset(&server_socket, 0, sizeof(server_socket));
	/*socket family*/
	server_socket.sin_family = AF_INET;
	/*Ip adress*/
	server_socket.sin_addr.s_addr = inet_addr("127.0.0.1");
	/*port*/
	server_socket.sin_port = htons(PORT);
	rc= bind(sock, (struct sockaddr *) &client_socket, sizeof(client_socket));
	if (rc < 0) 
	{
		/*cout << argv[0] << ": cannot bind port (" << strerror(errno) << ")" << std::endl;*/
		cout<<"Cannot bind port\n";
		//return EXIT_FAILURE;
	}
	/*******************************************************/
	
	
	char buffer[BUFLEN];
	char buf[BUFLEN];
	int num_characters = 0;
	/*while loop to read the number of characters in the file*/
	while (!myfile.eof())
      	{
            myfile.get(buffer[i]);
            i++;
            num_characters ++;
      	}  
      	
      	/* TO REMOVE ?
      	begin = myfile.tellg();
	myfile.seekg (0, ios::end);
	end = myfile.tellg();
	myfile.close();*/
	filesize  = GetFileSize("test.txt");
      	cout<<"************************"<<endl;
      	cout<<"FILESIZE: "<<filesize <<endl;
      	cout<<"NUMBER OF CHARACTERS: "<<num_characters<<endl;
      	cout<<"************************"<<endl;
      	int frameid=1;
      	int frameid2=1;
	while(1)
	{	
	/*******************************************************/
		/*sends test.txt contents to the server */
	/*******************************************************/
		/*splits packet into 8 bytes*/
		for(int i=1;i<=filesize/4;i++)
		{
				
			if (sendto(sock, buffer, strlen(buffer), 0, (struct sockaddr *) &server_socket, sizeof(server_socket)) < 0)
			{
				cout<<"error in sendto()";
				exit(0);
			}
			frameid++;
			sleep(3);
			if(i>256)
			{
				cout<<"Protocol Ending";
				exit(0);
			
			}
		}
		
	/*******************************************************/
		/*resets the memory*/
		memset(buf, '\0', BUFLEN);
		/*converts from char to unsigned char*/
		socklen_t server_len = sizeof(server_socket);
	/*******************************************************/
		/*receives test.txt contents from the server */
	/*******************************************************/
		/*splits packet into bytes*/
		for(int i=0;i<=filesize/8;i++)
		{
			if(recvfrom(sock, buf, strlen(buffer), 0, (struct sockaddr *) &server_socket,  &server_len) <0)
			{
				cerr<<"recvfrom() failed...";
				exit(0);
			}	
			cout<<endl;
			cout<<"SERVER CONNECTION: "<< inet_ntoa(server_socket.sin_addr)<<endl;
			cout<<"SERVER SOCKET: "<<PORT<<endl;
			cout<<"FILESIZE: "<<filesize<<endl;
			/*cout <<"size2: " << (end-begin) << " bytes." << endl;*/
			cout<<"RECEIVED DATA SENT BACK FROM SERVER: "<< buf<<endl;
			frameid2++;
			sleep(2);
		}
	/*******************************************************/
	}
}


int main(int argc, char ** argv)
{
	int opt;
	int flag = 0;
	/*switch statement used to select between client
	and server function */
	while ((opt = getopt(argc, argv, "cs")) != -1) 
	{
		/**c++ dosent support switch statements with
		strings so a single character was used instead*/
		switch (opt) {
		case 'c':
			flag = 1;
			break;
		case 's':
			flag = 2;
			break;
		case '?':
		default:
			flag = 0;
		}
	}
	/*Help menu for directing the proper launch command*/
	if(flag == 0)
	{
		cerr << "***************************************\n  To launch the program please input the \n [ ./ ]  command followed by the name of \n  the executable file [ example ] followed \n by  [ -s or -c ]: " << argv[0] << " [ -c or -s ]\n ***************************************\n ";
		exit(EXIT_FAILURE);
	}
	/* launches the client function*/
	if(flag == 1)
		client_main();

	/*launches the server function*/
	if(flag == 2)
		server_main();
	return 0;
}

