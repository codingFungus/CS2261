

int main() {
    //init DSP_CT Ptr
    unsigned short* displayController;
    //Point DSP_CT Ptr to correct address
    displayController = 0x04000000;
    //Dereference pointer to set controller to mode 3 and bg 2
    *displayController = MODE3 | BG2
    while(1) {
        
    }
    return 0;
}
