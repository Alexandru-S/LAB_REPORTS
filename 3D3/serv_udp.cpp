#include <iostream>
#ifdef _WIN32
#include <WinSock2.h>
#endif
#include <stdio.h>
#pragma comment(lib, "ws2_32.lib")

#define BUFLEN 512
#define PORT 8888

int main(void)
{
	SOCKET Socket;
	struct sockaddr_in serverAddr, senderAddr;
	int slen, recv_len;
	char buf[BUFLEN];

	WSADATA wsa;

	slen = sizeof(senderAddr);

	//Socket Initilization
	printf("\nInitializing Socket...");

	if(WSAStartup(MAKEWORD(2,2), &wsa) != 0)
	{
		printf("Failed. Error: %d", WSAGetLastError());
		exit(EXIT_FAILURE);
	}

	printf("Initialized..\n");

	//Create socket
	if((Socket = socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP)) == SOCKET_ERROR)
	{
		printf("Socket creation failed... code: %d", WSAGetLastError());
		exit(EXIT_FAILURE);
	}

	//Address structure
	serverAddr.sin_family = AF_INET;
	serverAddr.sin_port = htons(PORT);
	serverAddr.sin_addr.s_addr = INADDR_ANY;

	//bind socket
	if(bind(Socket, (struct sockaddr *) &serverAddr, sizeof(serverAddr)) == SOCKET_ERROR)
	{
		printf("Failed to bind socket");
		exit(EXIT_FAILURE);
	}

	printf("Bind done...");

	//main loop
	while(1)
	{
		printf("Waiting for data... \n");

		//receive a message
		memset(buf, '\0', BUFLEN);

		//try to receive data
		if(recv_len = recvfrom(Socket, buf, BUFLEN, 0, (struct sockaddr *) &senderAddr, &slen) == SOCKET_ERROR)
		{
			printf("recvfrom() failed...");
			exit(EXIT_FAILURE);
		}

		printf("Received from %s\n", inet_ntoa(senderAddr.sin_addr));
		printf("Data: %s\n", buf);
	
		//send the message
		if(sendto(Socket, buf, recv_len, 0, (struct sockaddr *) &senderAddr, slen) == SOCKET_ERROR)
		{
			printf("sendto() failed");
			exit(EXIT_FAILURE);
		}

	}//end while

	closesocket(Socket);
	WSACleanup();

	return 0;
}
