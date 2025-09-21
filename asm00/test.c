#include "unistd.h"

int	main(void)
{
	char a = '0';
	char b = '1';
	char c = '2';

	while (a <= '7')
	{
		b = a + 1;
		while (b <= '8')
		{
			c = b + 1;
			while (c <= '9')
			{
				write(1, &a, 1);
				write(1, &b, 1);
				write(1, &c, 1);
				write(1, "\n", 1);
				c++;
			}
			b++;
		}
		a++;
	};
	return (0);
}
