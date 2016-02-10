#include <iomanip>
#include <iostream>
#include <math.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netdb.h>
#include <stdexcept>
 #include <arpa/inet.h>

#include <string.h>
#include <unistd.h>
#include <stdlib.h>
#include <errno.h>
#define MAXHOSTNAME 256

using namespace std;

int main()
{
	struct sockaddr_in socketInfo;
	struct hostent *hPtr;
	char sysHost[MAXHOSTNAME+1];
	int portNumber;
	int socketHandle;
	
	int iSocketType;
	int iBytesSent = 0;
	char const *pMessage ="message to send";
	// number of bytes (includes NULL termination)
	int  iMessageLength = 16;  
	sockaddr * pSendAddress;
	
	
	const char *remoteHost ="localhost";
	cout<<"*************************"<<endl;
	cout<<"********UDP_CLIENT*******"<<endl;
	cout<<"*************************"<<endl;
	/*cout<<" Please enter the ip number of the server "<<endl;
	cin>> remoteHost;*/
	cout<<" Please enter the port number"<<endl;
	cin>>portNumber;
	// Clear structure memory
	 bzero(&socketInfo, sizeof(sockaddr_in));   
	 // Get system information
   	if((hPtr = gethostbyname(remoteHost)) == NULL)
   	{
      		cerr<<"System DNS name resolution not configured properly."<< endl;
      		cerr<<"Error number: " << ECONNREFUSED << endl;
      		exit(EXIT_FAILURE);
   	}
	// creating  socket
   	if((socketHandle = socket(AF_INET, SOCK_DGRAM, 0)) < 0)
   	{	
      		close(socketHandle);
      		exit(EXIT_FAILURE);
   	}
   	
   	 // Load system information into socket data structures
 	memcpy((char *)&socketInfo.sin_addr, hPtr->h_addr, hPtr->h_length);
	socketInfo.sin_family = AF_INET;
	// Set port number
   	socketInfo.sin_port = htons((u_short)portNumber);      
 
	 // Actual number of bytes read by function read()
	if ((iBytesSent = sendto(socketHandle, (char*) pMessage,(int) iMessageLength, 0,(struct sockaddr*) pSendAddress,(int) sizeof(struct sockaddr_in))) < 0 )
    	{
        cerr << "Sendto failed with error " << errno  << endl;
        exit(EXIT_FAILURE);
    	}
	

	return 0;
}
