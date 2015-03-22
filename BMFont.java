// Draw fonts a pixel at a time
//
// To make your own fonts, see:
//     http://larsee.dk/converting-fonts-to-c-source-using-bmfont2c/
//
// Loose conversion of .c output of the above program
//

class BMFont {
    int GlyphCount;
    int FirstAsciiCode;
    int GlyphBytesWidth;
    int GlyphHeight;
    int FixedWidth;
    int[] GlyphWidth;
    int[] GlyphBitmaps;

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
        // GlyphWidth = _GlyphWidth;
        // GlyphBitmaps = _GlyphBitmaps;
    };

};
