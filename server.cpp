#define MAX_BUFFER 30000

#include <iostream>
#include <sstream>
#include <cstring>
#include <csignal>
#include <unistd.h>
#include <netinet/in.h>
#include <sys/socket.h>
#include <sys/types.h>

void		exitProgram(int status = 0);

int*		getFd(int* i = NULL);

std::string	getResponse(void);

int	main(int argc, char *argv[])
{
	if (argc != 2)
		return (3);

	signal(SIGINT, exitProgram);

	// Create socket
	int	server_fd = socket(AF_INET, SOCK_STREAM, 0);
	if (server_fd == -1)
	{
		perror("socket");
		exit(4);
	}

	// Configure socket
	sockaddr_in	serv_addr;
	socklen_t	addrlen = sizeof(sockaddr_in);
	
	memset(&serv_addr, 0, addrlen);
	serv_addr.sin_addr.s_addr = INADDR_ANY;
	serv_addr.sin_family = AF_INET;
	serv_addr.sin_port = htons(atoi(argv[1]));

	if (bind(server_fd, (sockaddr *)&serv_addr, addrlen) == -1)
	{
		perror("bind");
		exitProgram(5);
	}

	// Turn socket listen
	if (listen(server_fd, 10) == -1)
	{
		perror("listen");
		exitProgram(6);
	}
	
	// Server Routine
	while (true)
	{
		int	clt_fd = accept(server_fd, NULL, NULL);
		if (clt_fd < 0)
		{
			perror("clt_fd");
			continue ;
		}

		std::cout << "\e[33mReading client request...\e[0m" << std::endl;
		char	buff[MAX_BUFFER + 1] = {0};
		size_t	bread = 0;

		if ((bread = recv(clt_fd, buff, MAX_BUFFER, 0)) <= 0)
		{
			std::cerr << "Error recv: " << strerror(errno) << std::endl;
			close (clt_fd);
			continue ;
		}
		std::cout << "Client on socket " << clt_fd << " request:" << std::endl
			<< "\e[35m>>>>>>>>>>>>>>>>>>>>>>\e[0m" << std::endl
			<< buff << std::endl
			<< "\e[35m<<<<<<<<<<<<<<<<<<<<<<\e[0m" << std::endl;

		std::cout << "\e[33mSending client response...\e[0m" << std::endl;
		std::string res = getResponse();
		if (send(clt_fd, res.c_str(), res.size(), 0) != static_cast<ssize_t>(res.size()))
		{
			std::cerr << "Error recv: " << strerror(errno) << std::endl;
		}
			close (clt_fd);
		std::cout << "\e[32mClient connection closed!\e[0m" << std::endl;
	}
}

std::string	getResponse(void)
{
	std::stringstream stream;

	stream
		<< "HTTP/1.1 200 OK" << std::endl
		<< "Date: Mon, 27 Jul 2009 12:28:53 GMT" << std::endl
		<< "Server: Apache" << std::endl
		<< "Last-Modified: Wed, 22 Jul 2009 19:15:56 GMT" << std::endl
		<< "ETag: \"34aa387-d-1568eb00\"" << std::endl
		<< "Accept-Ranges: bytes" << std::endl
		<< "Content-Length: 51" << std::endl
		<< "Vary: Accept-Encoding" << std::endl
		<< "Content-Type: text/plain" << std::endl
		<< std::endl;

	stream
		<< "Hello World! My content includes a trailing CRLF." << std::endl;

	return (stream.str());
}

int*	getFd(int* i)
{
	static int*	ptr;

	if (i)
		ptr = i;
	return (ptr);
}

void	exitProgram(int status)
{
	int	*ptr = getFd();

	if (ptr)
	{
		close(*ptr);
		*ptr = -1;
	}
	exit(status);
}
