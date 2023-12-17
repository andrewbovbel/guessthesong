from rich import print
from rich.progress import track
from time import sleep
import random

def main(timeout):
    def process_data():
        sleep(timeout * 0.01)

    for _ in track(range(100), description="[green]...booting"):
        process_data()

    n = 8
    m = n+1
    
    # loops for upper part
    for i in range(n//2-1):
        for j in range(m):
            
            # condition for printing stars to GFG upper line
            if i == n//2-2 and (j == 0 or j == m-1):
                print("[red]*", end=" ")
                
            # condition for printing stars to left upper
            elif j <= m//2 and ((i+j == n//2-3 and j <= m//4) \
                                or (j-i == m//2-n//2+3 and j > m//4)):
                print("[red]*", end=" ")
                
            # condition for printing stars to right upper
            elif j > m//2 and ((i+j == n//2-3+m//2 and j < 3*m//4) \
                            or (j-i == m//2-n//2+3+m//2 and j >= 3*m//4)):
                print("[red]*", end=" ")
                
            # condition for printing spaces
            else:
                print(" ", end=" ")
        print()
    
    # loops for lower part
    for i in range(n//2-1, n):
        for j in range(m):
            
            # condition for printing stars
            if (i-j == n//2-1) or (i+j == n-1+m//2):
                print('[red]*', end=" ")
                
            # condition for printing GFG
            elif i == n//2-1:
                
                if j == m//2-1:
                    print('I', end=" ")
                elif j == m//2+1:
                    print('Y', end=" ")
                elif j == m//2:
                    print('L', end=" ")
                else:
                    print(' ', end=" ")
                    
            # condition for printing spaces
            else:
                print(' ', end=" ")
                
        print()

    print("[bold]GOOD LUCK ON YOUR EXAM")