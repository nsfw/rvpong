class Font5x5 extends BMFont {
    static int[] widthData = {1};
    static int[] bitmapData = {1};

    public Font5x5(){
        super(43, // Glyph count
              48, // First ascii code
              1,  // Glyph width (bytes)
              5,  // Glyph height (bytes)
              0,  // Fixed width or 0 if variable
              widthData,
              bitmapData
            );
    }
}
