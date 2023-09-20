# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
int main() {
    unsigned short* displayController;
    displayController = 0x04000000;
    *displayController = 1027;
    while(1) {

    }
    return 0;
}
