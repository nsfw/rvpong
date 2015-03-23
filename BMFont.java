// Draw fonts a pixel at a time
//
// To make your own fonts, see:
//     http://larsee.dk/converting-fonts-to-c-source-using-bmfont2c/
//
// Loose conversion of .c output of the above program
//

class BMFont {
    public int GlyphCount;
    public int FirstAsciiCode;
    public int GlyphBytesWidth;
    public int GlyphHeight;
    public int FixedWidth;
    int[] GlyphWidth;
    int[] bitmap;

    public BMFont(int _GlyphCount,
                  int _FirstAsciiCode,
                  int _GlyphBytesWidth,
                  int _GlyphHeight,
                  int _FixedWidth,
                  int[] _GlyphWidth,
                  int[] _GlyphBitmaps){
        GlyphCount = _GlyphCount;
        FirstAsciiCode = _FirstAsciiCode;
        GlyphBytesWidth = _GlyphBytesWidth;
        GlyphHeight = _GlyphHeight;
        FixedWidth = _FixedWidth;
        // data arrays
        GlyphWidth = _GlyphWidth;
        bitmap = _GlyphBitmaps;
    };

    int getWidth(int c){
        if(FixedWidth != 0){
            return FixedWidth;
        }
        if(c<FirstAsciiCode) return 0;
        return GlyphWidth[c-FirstAsciiCode];
    }

    int getIndex(int c){
        if(c<FirstAsciiCode) return 0;
        return (c-FirstAsciiCode)*GlyphBytesWidth*GlyphHeight;
    }

};
