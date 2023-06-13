
import sys

def main():
	print('asm("\\')
	print('\t.syntax unified\\n\\')

	for line in sys.stdin:
		print('{}\\n\\'.format(line[:-1]))

	print('\t.syntax divided\\n\\')
	print('");')

if __name__ == '__main__':
	main()
