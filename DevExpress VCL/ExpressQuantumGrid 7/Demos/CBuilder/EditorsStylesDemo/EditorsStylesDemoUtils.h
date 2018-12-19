//---------------------------------------------------------------------------

#ifndef EditorsStylesDemoUtilsH
#define EditorsStylesDemoUtilsH
#include "EditorsStylesDemoBase.h"
#include "Graphics.hpp"

struct TJPEGOptions {
  Shortint CompressionQuality;
  bool Grayscale;
  bool ProgressiveEncoding;
};

const TextProcessingFrameID = 0;
const ImageProcessingFrameID = 1;
const SolarSystemFrameID = 2;
const NoteBookFrameID = 3;
const IssuesFrameID = 4;
const StylesPaletteFrameID = 5;

TEditorsStylesDemoBaseFrame* __fastcall CreateFrameByID(int AID);
void ConvertBitmapToJPEG(Graphics::TBitmap* ABitmap, String AJPGFileName, TJPEGOptions AJPEGOptions);

#endif

