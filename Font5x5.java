class Font5x5 extends BMFont {

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

    static int[] widthData = {
     6,  3,  5,  5,  5,  5,  5,  5,
     5,  5,  1,  1,  1,  1,  1,  1,
     1,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  5,  5,  5,  6,  6,  6,
     6,  6,  6,  6,  6,  6,  6,  6,
     6,  6,  6,
    };

    static int[] bitmapData = {
    // ASCII: 48, char width: 6
    0x70,  // -OOO--..
    0x88,  // O---O-..
    0x88,  // O---O-..
    0x88,  // O---O-..
    0x70,  // -OOO--..

    // ASCII: 49, char width: 3
    0xc0,  // OO-.....
    0x40,  // -O-.....
    0x40,  // -O-.....
    0x40,  // -O-.....
    0x40,  // -O-.....

    // ASCII: 50, char width: 5
    0x60,  // -OO--...
    0x90,  // O--O-...
    0x20,  // --O--...
    0x40,  // -O---...
    0xf0,  // OOOO-...

    // ASCII: 51, char width: 5
    0xf0,  // OOOO-...
    0x10,  // ---O-...
    0x70,  // -OOO-...
    0x10,  // ---O-...
    0xf0,  // OOOO-...

    // ASCII: 52, char width: 5
    0x90,  // O--O-...
    0x90,  // O--O-...
    0xf0,  // OOOO-...
    0x10,  // ---O-...
    0x10,  // ---O-...

    // ASCII: 53, char width: 5
    0x70,  // -OOO-...
    0x80,  // O----...
    0xf0,  // OOOO-...
    0x10,  // ---O-...
    0xf0,  // OOOO-...

    // ASCII: 54, char width: 5
    0xf0,  // OOOO-...
    0x80,  // O----...
    0xf0,  // OOOO-...
    0x90,  // O--O-...
    0xf0,  // OOOO-...

    // ASCII: 55, char width: 5
    0xf0,  // OOOO-...
    0x10,  // ---O-...
    0x20,  // --O--...
    0x40,  // -O---...
    0x80,  // O----...

    // ASCII: 56, char width: 5
    0xf0,  // OOOO-...
    0x90,  // O--O-...
    0x60,  // -OO--...
    0x90,  // O--O-...
    0xf0,  // OOOO-...

    // ASCII: 57, char width: 5
    0xf0,  // OOOO-...
    0x90,  // O--O-...
    0xf0,  // OOOO-...
    0x10,  // ---O-...
    0xf0,  // OOOO-...

    // No glyph for ASCII: 58, using substitute:
    // ASCII: 32, char width: 1
    0x00,  // -.......
    0x00,  // -.......
    0x00,  // -.......
    0x00,  // -.......
    0x00,  // -.......

    // No glyph for ASCII: 59, using substitute:
    // ASCII: 32, char width: 1
    0x00,  // -.......
    0x00,  // -.......
    0x00,  // -.......
    0x00,  // -.......
    0x00,  // -.......

    // No glyph for ASCII: 60, using substitute:
    // ASCII: 32, char width: 1
    0x00,  // -.......
    0x00,  // -.......
    0x00,  // -.......
    0x00,  // -.......
    0x00,  // -.......

    // No glyph for ASCII: 61, using substitute:
    // ASCII: 32, char width: 1
    0x00,  // -.......
    0x00,  // -.......
    0x00,  // -.......
    0x00,  // -.......
    0x00,  // -.......

    // No glyph for ASCII: 62, using substitute:
    // ASCII: 32, char width: 1
    0x00,  // -.......
    0x00,  // -.......
    0x00,  // -.......
    0x00,  // -.......
    0x00,  // -.......

    // No glyph for ASCII: 63, using substitute:
    // ASCII: 32, char width: 1
    0x00,  // -.......
    0x00,  // -.......
    0x00,  // -.......
    0x00,  // -.......
    0x00,  // -.......

    // No glyph for ASCII: 64, using substitute:
    // ASCII: 32, char width: 1
    0x00,  // -.......
    0x00,  // -.......
    0x00,  // -.......
    0x00,  // -.......
    0x00,  // -.......

    // ASCII: 65, char width: 6
    0xf8,  // OOOOO-..
    0x88,  // O---O-..
    0xf8,  // OOOOO-..
    0x88,  // O---O-..
    0x88,  // O---O-..

    // ASCII: 66, char width: 6
    0xf0,  // OOOO--..
    0x88,  // O---O-..
    0xf8,  // OOOOO-..
    0x88,  // O---O-..
    0xf0,  // OOOO--..

    // ASCII: 67, char width: 6
    0xf8,  // OOOOO-..
    0x80,  // O-----..
    0x80,  // O-----..
    0x80,  // O-----..
    0xf8,  // OOOOO-..

    // ASCII: 68, char width: 6
    0xf0,  // OOOO--..
    0x88,  // O---O-..
    0x88,  // O---O-..
    0x88,  // O---O-..
    0xf0,  // OOOO--..

    // ASCII: 69, char width: 6
    0xf8,  // OOOOO-..
    0x80,  // O-----..
    0xf0,  // OOOO--..
    0x80,  // O-----..
    0xf8,  // OOOOO-..

    // ASCII: 70, char width: 6
    0xf8,  // OOOOO-..
    0x80,  // O-----..
    0xf0,  // OOOO--..
    0x80,  // O-----..
    0x80,  // O-----..

    // ASCII: 71, char width: 6
    0xf8,  // OOOOO-..
    0x80,  // O-----..
    0xb8,  // O-OOO-..
    0x88,  // O---O-..
    0xf8,  // OOOOO-..

    // ASCII: 72, char width: 6
    0x88,  // O---O-..
    0x88,  // O---O-..
    0xf8,  // OOOOO-..
    0x88,  // O---O-..
    0x88,  // O---O-..

    // ASCII: 73, char width: 6
    0xf8,  // OOOOO-..
    0x20,  // --O---..
    0x20,  // --O---..
    0x20,  // --O---..
    0xf8,  // OOOOO-..

    // ASCII: 74, char width: 5
    0xf0,  // OOOO-...
    0x20,  // --O--...
    0x20,  // --O--...
    0xa0,  // O-O--...
    0xe0,  // OOO--...

    // ASCII: 75, char width: 5
    0x90,  // O--O-...
    0xa0,  // O-O--...
    0xc0,  // OO---...
    0xa0,  // O-O--...
    0x90,  // O--O-...

    // ASCII: 76, char width: 5
    0x80,  // O----...
    0x80,  // O----...
    0x80,  // O----...
    0x80,  // O----...
    0xf0,  // OOOO-...

    // ASCII: 77, char width: 6
    0x88,  // O---O-..
    0xd8,  // OO-OO-..
    0xa8,  // O-O-O-..
    0x88,  // O---O-..
    0x88,  // O---O-..

    // ASCII: 78, char width: 6
    0x88,  // O---O-..
    0xc8,  // OO--O-..
    0xa8,  // O-O-O-..
    0x98,  // O--OO-..
    0x88,  // O---O-..

    // ASCII: 79, char width: 6
    0xf8,  // OOOOO-..
    0x88,  // O---O-..
    0x88,  // O---O-..
    0x88,  // O---O-..
    0xf8,  // OOOOO-..

    // ASCII: 80, char width: 6
    0xf8,  // OOOOO-..
    0x88,  // O---O-..
    0xf8,  // OOOOO-..
    0x80,  // O-----..
    0x80,  // O-----..

    // ASCII: 81, char width: 6
    0xf8,  // OOOOO-..
    0x88,  // O---O-..
    0x88,  // O---O-..
    0x98,  // O--OO-..
    0xf8,  // OOOOO-..

    // ASCII: 82, char width: 6
    0xf8,  // OOOOO-..
    0x88,  // O---O-..
    0xf8,  // OOOOO-..
    0x90,  // O--O--..
    0x88,  // O---O-..

    // ASCII: 83, char width: 6
    0xf8,  // OOOOO-..
    0x80,  // O-----..
    0xf8,  // OOOOO-..
    0x08,  // ----O-..
    0xf8,  // OOOOO-..

    // ASCII: 84, char width: 6
    0xf8,  // OOOOO-..
    0x20,  // --O---..
    0x20,  // --O---..
    0x20,  // --O---..
    0x20,  // --O---..

    // ASCII: 85, char width: 6
    0x88,  // O---O-..
    0x88,  // O---O-..
    0x88,  // O---O-..
    0x88,  // O---O-..
    0xf8,  // OOOOO-..

    // ASCII: 86, char width: 6
    0x88,  // O---O-..
    0x88,  // O---O-..
    0x50,  // -O-O--..
    0x50,  // -O-O--..
    0x20,  // --O---..

    // ASCII: 87, char width: 6
    0x88,  // O---O-..
    0x88,  // O---O-..
    0x88,  // O---O-..
    0xa8,  // O-O-O-..
    0xd8,  // OO-OO-..

    // ASCII: 88, char width: 6
    0x88,  // O---O-..
    0x50,  // -O-O--..
    0x20,  // --O---..
    0x50,  // -O-O--..
    0x88,  // O---O-..

    // ASCII: 89, char width: 6
    0x88,  // O---O-..
    0x50,  // -O-O--..
    0x20,  // --O---..
    0x20,  // --O---..
    0x20,  // --O---..

    // ASCII: 90, char width: 6
    0xf8,  // OOOOO-..
    0x10,  // ---O--..
    0x20,  // --O---..
    0x40,  // -O----..
    0xf8,  // OOOOO-..
};
}
