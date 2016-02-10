#include <iostream>
//#include <WinSock2.h>

#pragma comment(lib, "ws2_32.lib")

#define SERVER "127.0.0.1"
#define BUFLEN 512
#define PORT 8888

int main(void)
{
	struct sockaddr_in serverAddr;
	int soc, slen = sizeof(serverAddr);
	char buf[BUFLEN];
	char message[BUFLEN];
	WSADATA wsa;

	//Socket Initilization
	printf("\nInitializing Socket...");

	if(WSAStartup(MAKEWORD(2,2), &wsa) != 0)
	{
		printf("Failed. Error: %d", WSAGetLastError());
		exit(EXIT_FAILURE);
	}

	printf("Initialized..\n");

	//Create socket
	if((soc = socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP)) == SOCKET_ERROR)
	{
		printf("Socket creation failed... code: %d", WSAGetLastError());
		exit(EXIT_FAILURE);
	}

	//Address structure
	memset((char *) &serverAddr, 0, sizeof(serverAddr));
	serverAddr.sin_family = AF_INET;
	serverAddr.sin_port = htons(PORT);
	serverAddr.sin_addr.S_un.S_addr = inet_addr(SERVER);

	while(1)
	{
		printf("Message: ");
		gets(message);

		//send the message
		if(sendto(soc, message, strlen(message), 0, (struct sockaddr *) &serverAddr, slen) == SOCKET_ERROR)
		{
			printf("sendto() failed");
			exit(EXIT_FAILURE);
		}

		//receive a message
		memset(buf, '\0', BUFLEN);

		if(recvfrom(soc, buf, BUFLEN, 0, (struct sockaddr *) &serverAddr, &slen) == SOCKET_ERROR)
		{
			printf("recvfrom() failed...");
			exit(EXIT_FAILURE);
		}

		printf("Received from %s\n", inet_ntoa(serverAddr.sin_addr));
		printf("Data: %s\n", buf);
	}//end while

	closesocket(soc);
	WSACleanup();

	return 0;
}
