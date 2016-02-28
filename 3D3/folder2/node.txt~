#include <iostream>
#include <unistd.h>
#include <cstdlib>
#include <cstring>
#include <netdb.h>
#include <stdio.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <algorithm>
#include <stdlib.h>
#include <string.h>
#include <bitset>
#include <sstream>
#include <unistd.h>
#include <netinet/in.h>
#include <cerrno>
#include <cstring>
#include <fstream>
#include <time.h>
#include <sys/uio.h>
#include <zlib.h>

#define BUFLEN 1024
#define PORT 5562
using namespace std;
static const string compar="011111";

/*8 bytes*/
/*2 bytes for header - sequence number*/
/*4 bytes for packet*/
/*2 bytes for trailer - crc*/ 


/* alorithm of calculating the 'checksum'*/
 /* polynomial*/

/* converts int from binary text*/


/*******************************************************/
    	/*CRC*/
/*******************************************************/
int getIntFromBinaryText(const char* text)
{
    int value = 0;
    while(*text)
    {
        value <<= 1;
             if(*text == '1')
             {   
              	value |= 1;
              }
        else if(*text == '0');          
        else                     
        	return -1; /* invalid input*/
        	/*return a negative number to indicate error*/
        ++text;
    }
 
    return value;
}
/*converts the text back to binary string*/
std::string getBinaryTextFromInt(int value)
{
    std::string text;
    
 	/*assume unsigned*/
    while(value > 0)
    {
        if(value & 1)       
        {
        	text += '1';
        }
        else                
        {
        	text += '0';
        }
        value >>= 1;
    }
 
    if(text.empty())        
    {
    	return "0";
    }
    std::reverse( text.begin(), text.end() );       
    return text;
}
/*******************************************************/

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

bool bitsize(string const &tmp, string const &compar)
{
	return tmp.size() >=compar.size() && tmp.compare(tmp.size() - compar.size(), compar.size(), compar)==0;
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
	long filesize;
	// declare the 'out' stream
	ofstream out;    
	filesize  = GetFileSize("test.txt");
	
	std::ofstream ofs;
	ofs.open("out.txt", std::ofstream::out | std::ofstream::trunc);
	ofs.close();
	
	
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
	int servHeader1=1;
	int servHeader2=1;
	while (1) 
	{	
	/*******************************************************/
		/*Receives test.txt contents from the client */
	/*******************************************************/
		for(int i=1;i<=filesize/4;i+=4)
		{
			socklen_t client_len = sizeof(client_socket);
			if ((received = recvfrom(sock, buffer, 255, 0, (struct sockaddr *) &client_socket, &client_len)) < 0) 
			{
				exit(0);
			}
			buffer[received] = '\0';
			cout <<"SERVER CONNECTION ON RECEIVING: "<< inet_ntoa(client_socket.sin_addr)<<"\t"<<endl;
			cout<<"SERVER PORT: "<<PORT<<endl;
			cout<<"RECEIVED DATA FRAME: "<<servHeader1<<endl;
			cout <<"RECEIVED DATA SENT FROM CLIENT: "<< buffer<<endl;
			/*converts char to string*/
			string s_buffer(buffer);
			/*unstuff bits*/
  			/*char sa2[s_buffer.length()];
  			s_buffer.copy(sa2, s_buffer.length());
  			string s2one="";
  			string s2two="";
  			/*bitstuffing 
  			for(int i =0 ; i<s_buffer.length();i++)
  			{
  				s2one+= s2two[i];
  				s2two+=s2two[i];
  			
  			
  				if(bitsize(s2one , compar))
  				{
  					s2one ="";
  					i++;
  				}
  			}*/
  			string s2=s_buffer;
			
			cout<<"++++++++++"<<endl;
			string header = s2.substr( 0, 8);
			cout<<"HEADER: "<<header<<endl;
			string packet = s2.substr( 8, 32);
			cout<<"PACKET: "<<packet<<endl;
			string crc = s2.substr(40, 8);
			
			string text=crc;
			int divisor = getIntFromBinaryText("01111111");
			int dividend = getIntFromBinaryText(text.c_str());
  			int remainder = dividend % divisor;
  			string tmp4 = getBinaryTextFromInt(remainder);
  			
  			
  			
  			
  			
  			cout<<"ReCEIVED CRC: "<<crc<<endl;
  			cout<<"CALCULATED CRC: "<<tmp4<<endl;
			cout<<"++++++++++"<<endl<<endl;
			servHeader1++;
			if(crc.compare(tmp4) != 0)
			{
				
				
				cout<<"!!!! DATA NOT  OK !!!!"<<endl<<endl;
			
				cout<<"----------------------"<<endl;
				cout<<"DATA HAS BEEN CORRUPED"<<endl;
				cout<<"RESETTING FRAME INSTANCE"<<endl;
				cout<<"----------------------"<<endl;
				char buffer[BUFLEN]="!!!!";
				socklen_t client_len = sizeof(client_socket);
				if (sendto(sock, buffer, strlen(buffer), 0, (struct sockaddr *) &client_socket, sizeof(client_socket)) < 0)
				{
					cout<<"error here";
					exit(0);
				}
				buffer[received] = '\0';
				
				servHeader1--;
			}
			else
			{
				cout<<"+++ DATA OK +++"<<endl;
				sleep(2);
				
				/***
				bitstuffing happens here
				*/

				if (sendto(sock, buffer, strlen(buffer), 0, (struct sockaddr *) &client_socket, sizeof(client_socket)) < 0)
				{
					cout<<"error here";
					exit(0);
				}
				cout <<"SERVER CONNECTION ON SENDING: "<< inet_ntoa(client_socket.sin_addr)<<"\t"<<endl;
				cout<<"SERVER PORT: "<<PORT<<endl;
				cout<<"RESEND DATA FRAME: "<<servHeader2<<endl;
				cout <<"RESEND DATA SENT FROM CLIENT: "<< buffer<<endl;
				cout<<"-------------"<<endl<<endl<<endl;
				servHeader2++;
				sleep(3);
				
	/*******************************************************/
	/*******************************************************/
		/* open data file*/
    		/*delete contents of file
    		and add new contents*/
    	/*******************************************************/
    				std::ofstream ofs;
				ofs.open("out.txt", std::ofstream::out | std::ofstream::app);
				 
    				std::stringstream sstream(packet);
    				string output;
    				while(sstream.good())
    				{
        				std::bitset<8> bits;
        				sstream >> bits;
        				char c = char(bits.to_ulong());
        				output += c;
    				}
				ofs<<output;
				ofs.close();
				sleep(1);
				
			}
		}
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
	char crc2char;
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
		cout<<"Cannot bind port\n";
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
      	
      	
	filesize  = GetFileSize("test.txt");
      	cout<<"************************"<<endl;
      	cout<<"FILESIZE: "<<filesize <<endl;
      	cout<<"NUMBER OF CHARACTERS: "<<num_characters<<endl;
      	cout<<"************************"<<endl;
      	int frameid=1;
      	int frameid2=1;
      	
      	
        /*******************************************************/
		/*loads .txt into a string */
	/*******************************************************/
      	ifstream ifstrfile("test.txt");
      	string stringfile;
      	ifstrfile.seekg(0, std::ios::end);
      	stringfile.reserve(ifstrfile.tellg());
      	ifstrfile.seekg(0, std::ios::beg);
      	stringfile. assign((istreambuf_iterator<char>(ifstrfile)),istreambuf_iterator<char>());
      	/*******************************************************/
      	
       /*******************************************************/
		/*sends test.txt contents to the server */
	/*******************************************************/
		
	while(1)
	{	
	
		/*splits packet into 4 bits
		thus there will be 256 frames*/
		for(int i=1;i<=filesize/4;i+=4)
		{
			if(i>256)
			{
				cout<<"Protocol Ending";
				exit(0);
			
			}
			
			/*increments through string 
			and copies it to the buffer*/	
			string substr1 = stringfile.substr(i,4);
			string tmp = substr1;
			string tmp2;
			/*127*/
			int divisor = getIntFromBinaryText("01111111");
			string binary_header; 
		
			/*converts the string characters to binary string*/
   			for (std::size_t s = 0; s < tmp.size(); ++s)
  			{
  				/*header conv to binary*/
  				binary_header = std::bitset<8>(frameid).to_string(); 
  				/*packet conv to binary*/
      			 	bitset<8> b(tmp.c_str()[s]);
      			 	tmp2+=b.to_string();
      			 	
  			}
  			
  			
  			string text =tmp2;
  			int dividend = getIntFromBinaryText(text.c_str());
  			int remainder = dividend % divisor;
  			/*crc*/
  			string tmp4 = getBinaryTextFromInt(remainder);
  			/*bitstuffing 
  			char sa[tmp2.length()];
  			tmp4.copy(sa, tmp2.length());
  			string sone="";
  			string stwo="";
  			
  			for(int i =0 ; i<tmp2.length();i++)
  			{
  				sone+= stwo[i];
  				stwo+=stwo[i];
  			
  			
  				if(bitsize(sone , compar))
  				{
  					sone = "";
  					stwo +="0";
  				}
  			}
  			string tmp10=stwo;*/
  			/*tmp3=header+packet*/
  			string tmp3= binary_header+tmp2;
  			/*gremlin*/
  			int v1 = rand() % 4+1;
  			int grm=0;
  			if(v1 <2 )
  			{
  				tmp4 =string ( tmp4.rbegin(), tmp4.rend());
  			grm++;
  			} 
  			
  			
  			/*frame=(header+packet)+crc*/
  			string tmp5 = tmp3+tmp4;
  			/*coppies binary string to char array*/
			strcpy(buffer,tmp5.c_str());
			
			if (sendto(sock, buffer, strlen(buffer), 0, (struct sockaddr *) &server_socket, sizeof(server_socket)) < 0)
			{
				cout<<"error in sendto()";
				exit(0);
			}	
			cout<<endl;
			cout<<"CLIENT CONNECTION ON SENDING: "<< inet_ntoa(server_socket.sin_addr)<<endl;
			cout<<"CLIENT SOCKET: "<<PORT<<endl;
			cout<<"FILESIZE: "<<filesize<<endl;
			/*cout <<"size2: " << (end-begin) << " bytes." << endl;*/		
			cout<<"SENDING PACKET FRAME: "<<frameid<<endl;
			cout<<"DATA TO BE SENT TO SERVER: "<< buffer<<endl;
			cout<<"+++++++++"<<endl;
			cout<<"HEADER: " << binary_header<<endl;
			cout<<"PACKET: "<<tmp2<<endl;
			cout<<"CRC: "<< tmp4<<endl;
			if(grm>0)
			{
				cout<<"GREMLIN ACTIVATED:"<<endl;
			}
			grm--;
			cout<<"+++++++++"<<endl;
			frameid++;
			sleep(4);
			
			
	/*******************************************************/
		/*resets the memory*/
			memset(buf, '\0', BUFLEN);
		/*converts from char to unsigned char*/
			socklen_t server_len = sizeof(server_socket);
			
	/*******************************************************/
		/*receives test.txt contents from the server */
	/*******************************************************/
			if(recvfrom(sock, buf, strlen(buffer), 0, (struct sockaddr *) &server_socket,  &server_len) <0)
			{
				cerr<<"recvfrom() failed...";
				exit(0);
			}
			
		
			if(std::strcmp(buffer,buf)==0)
			{
				cout<<"+++DATA OK+++"<<endl;
				
				cout<<endl;
				cout<<"CLIENT CONNECTION ON RECEIVING: "<< inet_ntoa(server_socket.sin_addr)<<endl;
				cout<<"CLIENT SOCKET: "<<PORT<<endl;
				cout<<"FILESIZE: "<<filesize<<endl;
				cout<<"RECEIVED PACKET FRAME: "<<frameid2<<endl;
				cout<<"RECEIVED DATA SENT BACK FROM SERVER: "<< buf<<endl;
		
				frameid2++;
			}
			else
			{
				cout<<endl;
				cout<<"CORUPTION ENCOUNTERED "<<end;
				cout<<"RECEIVED BUFFER"<<buffer<<endl;
				cout<<"RESENDING..."<<endl;
				/*reverse the reversed packet*/
				if(v1 <2 )
  				{
  					tmp4 =string ( tmp4.rbegin(), tmp4.rend());
  				} 
  			
  			
  				/*frame=(header+packet)+crc*/
  				string tmp5 = tmp3+tmp4;
  				/*coppies binary string to char array*/
				strcpy(buffer,tmp5.c_str());
				
				if (sendto(sock, buffer, strlen(buffer), 0, (struct sockaddr *) &server_socket, sizeof(server_socket)) < 0)
				{
				cout<<"error in sendto()";
				exit(0);
				}	
				cout<<endl;
				cout<<"!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"<<endl;
				cout<<"CLIENT CONNECTION ON RE-SENDING: "<< inet_ntoa(server_socket.sin_addr)<<endl;
				cout<<"CLIENT SOCKET: "<<PORT<<endl;
				cout<<"FILESIZE: "<<filesize<<endl;
				
				cout<<"SENDING PACKET FRAME: "<<frameid<<endl;
				cout<<"DATA TO BE SENT TO SERVER: "<< buffer<<endl;
				cout<<"+++++++++"<<endl;
				cout<<"HEADER: " << binary_header<<endl;
				cout<<"PACKET: "<<tmp2<<endl;
				cout<<"CRC: "<< tmp4<<endl;
				cout<<"!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"<<endl<<endl;
					
				//i-=4;
				frameid--;
				//frameid2--;
			}
			memset(buffer, '\0', BUFLEN);
			sleep(4);
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

