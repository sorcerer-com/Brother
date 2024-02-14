1. Get .ttf font
2. otf2bdf -r 72 -p 60 <font.ttf> -o <font.bdf>
 * http://www.komeil.com/blog/chortkeh-bdf-font-viewer-2-0
 *copy 2x .dll
 - -r <DPI>
 - -p <point_size>
3. bdfconv.exe -f 1 -m "0-127,1024-1279" -n custom_cyrillic -o <font.c> <font.bdf>
 * https://stncrn.github.io/u8g2-unifont-helper/
 - -m <unicode_range> ("0-127,1024-1279" - latin + cyrillic)
 - -n <font_name>
 - -o <output_file>
4. #include <output_file> in code
5. gfx->setFont(<font_name>)