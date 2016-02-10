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
#include <strings.h>
#include <stdio.h>

#define MAXHOSTNAME 256
using namespace std;

int main()
{
	struct sockaddr_in socketInfo;
	struct hostent *hPtr;
	char sysHost[MAXHOSTNAME+1];
	int portNumber;
	int socketHandle;
	
	
	char *pcIpAddress;
	unsigned short shPort;

	//const char *ipNumber;
	cout<<"*************************"<<endl;
	cout<<"********UDP_SERVER*******"<<endl;
	cout<<"*************************"<<endl;
	/*cout<<" Please enter the ip number of this server "<<endl;
	cin>>ipNumber;*/
	cout<<" Please enter the port number"<<endl;
	cin>>portNumber;
	// Clear structure memory
	 bzero(&socketInfo, sizeof(sockaddr_in));  
 

  	 // Get system information
  	 gethostname(sysHost, MAXHOSTNAME);  // Get the name of this 		computer we are running on
   	if((hPtr = gethostbyname(sysHost)) == NULL)
   	{
      		cerr << "System hostname misconfigured." << endl;
      		exit(EXIT_FAILURE);
   	}
	
	// creating  socket
   	if((socketHandle = socket(AF_INET, SOCK_DGRAM, 0)) < 0)
   	{	
      		close(socketHandle);
      		//exit(EXIT_FAILURE);
   	}
   	socketInfo.sin_family = AF_INET;
   	// Use any address available to the system
   	socketInfo.sin_addr.s_addr = htonl(INADDR_ANY); 
   	// Set port number
   	socketInfo.sin_port = htons(portNumber); 
   	
   	// Bind the socket to a local socket address
   	if( bind(socketHandle, (struct sockaddr *) &socketInfo, sizeof(socketInfo)) < 0)
   	{
      		close(socketHandle);
      		perror("bind");
      		//exit(EXIT_FAILURE);
   	}
   	/*else
   	{
   		cout<<"socketHandle -"<<socketHandle<<endl;
   		cout<<"sockaddr -"<<sockaddr<<endl;
   		cout<<"sockInfo -"<<sockInfo<<endl;
   	
   	}*/
   	//listen(socketHandle, 1); //not possible in udp
   	/*************************************************/
  
  	int iLength;
  	// Actual number of bytes read by function read()
  	int rc=0;  
  	// Running total "count" of bytes read
	int count=0;  
	// Number of bytes we want to read each pass
	int numToRead=32; 
	char buf[512];
  	int _iMessageLength=100;
  	char const* _pcMessage ="Hello from server";
  	int _iNumRead = 0;
  	
   	struct sockaddr_in stReceiveAddr;
   	iLength = (int) sizeof(struct sockaddr_in);
   	memset((void*) &stReceiveAddr, 0, iLength);
   	

   	rc = recvfrom(socketHandle, (char*) _pcMessage, (int) _iMessageLength, 0,(struct sockaddr *) &stReceiveAddr, (socklen_t*)&iLength);
   	if( rc == 0 )
   	{
      		cerr << "ERROR! Socket closed" << endl;
   	}
   	else if (rc == -1)
   	{
      		cerr << "ERROR! Socket error" << endl;
      		close(socketHandle);
   	}
	

	pcIpAddress = inet_ntoa(stReceiveAddr.sin_addr);
	shPort = ntohs(stReceiveAddr.sin_port);

	cout << "Socket Received: " << _iNumRead << " bytes from "<< pcIpAddress << ":" << shPort << endl; 
	/***********************************************************/
	while(count < numToRead)
	{
   	// rc is the number of bytes returned.
   		if ( (rc = read(socketHandle, buf, numToRead - count)) > 0)
   		{
      			count += rc;
      			//buf += rc;      // Set buffer pointer for next read
   		}
   		else if(rc < 0)
   		{
      			close(socketHandle);
      			exit(EXIT_FAILURE);
   		}

   	cout << "Number of bytes read: " << count << endl;
   	cout << "Received: " << buf << endl;
	}

   	/**************************************************/
   	/*int socketConnection;
  	if( (socketConnection = accept(socketHandle, NULL, NULL)) < 0)
   	{
      		exit(EXIT_FAILURE);
   	}
   	close(socketHandle);*/

   	/*int rc = 0;  // Actual number of bytes read
   	char buf[512];*/

   	// rc is the number of characters returned.
   	// Note this is not typical. Typically one would only specify 		the number 
   	// of bytes to read a fixed header which would include the 		number of bytes
   	// to read. See "Tips and Best Practices" below.

   	/*rc = recvfrom(socketConnection, buf, 512, 0);
   	buf[rc]= (char) NULL;        // Null terminate string

   	cout << "Number of bytes read: " << rc << endl;
   	cout << "Received: " << buf << endl;*/
  	     
	return 0;
}
