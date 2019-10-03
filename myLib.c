#include "myLib.h"

// The start of the video memory
unsigned short *videoBuffer = (unsigned short *)0x6000000;

// The start of DMA registers
DMA *dma = (DMA *)0x40000B0;

// Set a pixel on the screen in Mode 3
void setPixel3(int col, int row, unsigned short color) {

	videoBuffer[OFFSET(col, row, SCREENWIDTH)] = color;
}

// Set a pixel on the screen in Mode 4
void setPixel4(int col, int row, unsigned char colorIndex) {
    // TODO 1.0: Write this function

    unsigned short pData = videoBuffer[OFFSET(col, row, SCREENWIDTH)/2];

    // if odd (pixel on left of the 16 bits)
    if (col & 1) {
        pData &= 0x00FF;
        pData |= (colorIndex << 8);
    } // if even (pixel on right of the 16 bits)
    else {
        pData &= 0xFF00;
        pData |= colorIndex;
    }

    videoBuffer[OFFSET(col, row, SCREENWIDTH)/2] = pData;

}

// Draw a rectangle at the specified location and size in Mode 3
void drawRect3(int col, int row, int width, int height, volatile unsigned short color) {

	for(int r = 0; r < height; r++) {
        DMANow(3, &color, &videoBuffer[OFFSET(col, row+r, SCREENWIDTH)], DMA_SOURCE_FIXED | width);
	}
}

// Draw a rectangle at the specified location and size in Mode 4
void drawRect4(int col, int row, int width, int height, volatile unsigned char colorIndex) {

    // TODO 5.0: Write this function using DMA

    // Width - something (case dependent) is > 1 for DMA length

    if (!(col & 1) && !(width & 1)) {
    
    //  If col and width are even - DMA everything
        for (int y = 0; y < height; y++) {
            DMANow(3, &colorIndex, &videoBuffer[(OFFSET(col, row + y, SCREENWIDTH)/2)], DMA_SOURCE_FIXED | (width/2));
        }

    } else if (!(col & 1) && (width & 1)) {

    // If col is even but width is odd
    // DMA start of rect
        for (int y = 0; y < height; y++) {
            DMANow(3, &colorIndex, &videoBuffer[(OFFSET(col, row + y, SCREENWIDTH)/2)], DMA_SOURCE_FIXED | (width/2));
        }
    // SetPixel4 for the last column (Left side of last 16 bits)

    } else if ((col & 1) && (width & 1)) {

    // If both col and width are odd
    // SetPixel4 for the beginning (Right side of first 16 bits)
    // DMA end of rect

    } else if ((col & 1) && !(width & 1)) {

    // If col is odd but width is even
    // SetPixel4 for for the beginning (Right side of first 16 bits)
    // DMA middle of rect
    // SetPixel4 for the end (Left side of last 16 bits)
    
    }













}

// Fill the entire screen with a single color in Mode 3
void fillScreen3(volatile unsigned short color) {

	DMANow(3, &color, videoBuffer, DMA_SOURCE_FIXED | (SCREENWIDTH * SCREENHEIGHT));
}

// Fill the entire screen with a single color in Mode 4
void fillScreen4(volatile unsigned char colorIndex) {

    // TODO 2.0: Write this function using DMA

    // Use pData to create 16 bit representation of color
    // - Can write to 2 pixels at a time
    volatile unsigned short pData = colorIndex | (colorIndex << 8);
    DMANow(3, &pData, videoBuffer, ((SCREENHEIGHT * SCREENWIDTH / 2) | DMA_DESTINATION_INCREMENT | DMA_SOURCE_FIXED));

}

// Draw an image at the specified location and size in Mode 3
void drawImage3(int col, int row, int width, int height, const unsigned short *image) {

    for(int r = 0; r < height; r++) {
        DMANow(3, &image[OFFSET(0, r, width)], &videoBuffer[OFFSET(col, row+r, SCREENWIDTH)], width);
    }
}

// Draw an image at the specified location and size in Mode 4 (must be even col and width)
void drawImage4(int col, int row, int width, int height, const unsigned short *image) {

    // TODO 4.0: Write this function using DMA
    // add offset for image
    for (int y = 0; y < height; y++) {
        DMANow(3, &image[(OFFSET(0, y, width/2))], &videoBuffer[(OFFSET(col, row + y, SCREENWIDTH)/2)], (width/2));
    }

}

// Fill the entire screen with an image in Mode 3
void drawFullscreenImage3(const unsigned short *image) {

    DMANow(3, image, videoBuffer, SCREENWIDTH * SCREENHEIGHT);
}

// Fill the entire screen with an image in Mode 4
void drawFullscreenImage4(const unsigned short *image) {

    // TODO 3.0: Write this function using DMA
    DMANow(3, image, videoBuffer, ((SCREENHEIGHT * SCREENWIDTH / 2) | DMA_DESTINATION_INCREMENT | DMA_SOURCE_INCREMENT));

}

// Pause code execution until vertical blank begins
void waitForVBlank() {

	while(SCANLINECOUNTER > 160);
	while(SCANLINECOUNTER < 160);
}

// Flips the page
void flipPage() {

    if (REG_DISPCTL & DISP_BACKBUFFER) {
        videoBuffer = BACKBUFFER;
    } else {
        videoBuffer = FRONTBUFFER;
    }
    REG_DISPCTL ^= DISP_BACKBUFFER;
}

// Set up and begin a DMA transfer
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt) {

    // Turn DMA off
    dma[channel].cnt = 0;

    // Set source and destination
    dma[channel].src = src;
    dma[channel].dst = dst;

    // Set control and begin
    dma[channel].cnt = cnt | DMA_ON;
}

// Return true if the two rectangular areas are overlapping
int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB) {
    return rowA < rowB + heightB - 1 && rowA + heightA - 1 > rowB
        && colA < colB + widthB - 1 && colA + widthA - 1 > colB;
}