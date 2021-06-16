import ddf.minim.*;
import processing.video.*;

PImage Bedroom_day;
PImage Bedroom_night;
PImage Hallway_day;
PImage Hallway_night;
PImage Kitchen_day;
PImage Kitchen_night;
PImage Kitchen_curtain;
PImage Painting;
PImage Key1;
PImage Key2;
PImage Key3;
PImage KeyFinal;
PImage Magnifying_glass;
PImage Flashlight;
PImage Spider;
PImage Bed;
PImage Chest_closed;
PImage Chest_open;
PImage Cockroach_left;
PImage Cockroach_right;
PImage Cockroach_up;
PImage Cockroach_down;
PImage Cabinet_open_day;
PImage Cabinet_closed_day;
PImage Cabinet_open_night;
PImage Cabinet_closed_night;
PImage Oil;
PImage Inventory;
PImage Inventory_small;
PImage Menu_button_big;
PImage Text_bubble_spider;
PImage Text_bubble_box;
PImage Text_bubble_drain;
PImage Text_bubble_drain2;
PImage Text_bubble_mannequin;
PImage Text_bubble_hallway;
PImage Text_bubble_frontdoor;
PImage Mannequin_whole;
PImage Mannequin_shards;
PImage Hook;
PImage Bathroom_day;
PImage Bathroom_night;
PImage Letter_hallway_small;
PImage Letter_hallway_big;
PImage Letter_kitchen_day;
PImage Letter_kitchen_curtain;
PImage Letter_start;
PImage QuitLetter;
PImage Start;
PImage Settings;
PImage Credits;
PImage Quit;
PImage MenuBackground;
PImage SettingsBackground;
PImage SliderButton;
PImage CreditsBackground;
PImage End_game_scene;
PImage Buttons;
PImage Background_letter;

final int BEDROOM_DAY_SCENE     =  1;
final int HALLWAY_DAY_SCENE     =  2;
final int BEDROOM_NIGHT_SCENE   =  3;
final int HALLWAY_NIGHT_SCENE   =  4;
final int KITCHEN_DAY_SCENE     =  5;
final int KITCHEN_NIGHT_SCENE   =  6;
final int BATHROOM_DAY_SCENE    =  7;
final int BATHROOM_NIGHT_SCENE  =  8;
final int START_MENU_SCENE      =  9;
final int OPTIONS_MENU_SCENE    = 10;
final int KITCHEN_CURTAIN_SCENE = 11;
final int END_GAME_SCENE        = 12;
final int CREDITS_MENU_SCENE    = 13;
final int INTRO_SCENE           = 14;

int scene = START_MENU_SCENE;

Minim minim;

Movie video;

AudioPlayer keysSound;
AudioPlayer paintingSound;
AudioPlayer creakDoor;
AudioPlayer oilBottle;
AudioPlayer hiss_spider;
AudioPlayer cockroach;
AudioPlayer bedSound;
AudioPlayer mannequinBreak;
AudioPlayer backgroundSound;
AudioPlayer clickButton;
AudioPlayer hoverButton;
AudioPlayer curtains;

float volume = 3;

int paintingX = 0;
int paintingY = 0;

int cockroachX = 300;
int cockroachY = 660;

int mannequinX = 150;
int mannequinY = 210;

int cabinetDayOpenX = -10;
int cabinetDayOpenY = -10;

int cabinetDayClosedX = -10;
int cabinetDayClosedY = -10;

int letterX = -10;
int letterY = -10;

int quitX = 1150;
int quitY = 80;

int quit2X = 1050;
int quit2Y = 80;

float oilX_inventory;
float oilY_inventory;

float cockroachX_inventory;
float cockroachY_inventory;

float key1X = 780;
float key1Y = 160;

float key2X = 572.5;
float key2Y = 185;

float key1X_inventory = 585;
float key1Y_inventory = 778;

float key2X_inventory = 737;
float key2Y_inventory = 778;

float key3X_inventory = 892.5;
float key3Y_inventory = 778;

float keyFinalX_inventory = 737;
float keyFinalY_inventory = 775.5;

float spiderX = - 33;
float spiderY = - 20;

float oilX = 790;
float oilY = 207;

float hookX;
float hookY;

float volX = 660;
float volY = 437;

color black     = color( 0   );
color white     = color( 255 );
color dark_gray = color( 150 );
color gray      = color( 44  );

boolean hoverSound;

boolean wasMousePressed;

boolean haveAllKeys = false;
boolean isFinalKeyTaken;
boolean chestOpened;

boolean movePainting;
boolean moveSpider;

boolean isKey1Taken;
boolean isKey2Taken;
boolean isKey3Taken;
boolean isLetterTaken;
boolean isCockroachTaken;
boolean isOilTaken;
boolean isHookTaken;

boolean isCabinetDayOpen;
boolean isCabinetNightOpen;

boolean dragCockroach;
boolean dragOil;
boolean dragHook;
boolean dragFinalKey;

boolean playerHitsButton;

boolean isMannequinInShards = false;

boolean isFinalKeyUsed = false;

boolean isLetterKitchenTaken;

boolean paintingSoundPlayed = false;

boolean hoverPainting     = true;
boolean hoverKey1         = false;
boolean hoverKey2         = false;
boolean hoverLetter       = false;
boolean hoverBigLetter    = false;
boolean hoverCabinetDay   = false;
boolean hoverCabinetNight = false;
boolean hoverOil          = true;
boolean hoverSpider       = true;
boolean hoverMannequin    = true;

boolean showMagnifying_glass;
boolean showFlashlight;

boolean cockroachIsEaten = false;
boolean oilIsUsed = false;
boolean hookIsUsed = false;


//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


void setup() {
  size( 1400, 900, FX2D );

  Bedroom_day            = loadImage( "Bedroom_day.png"            );
  Bedroom_night          = loadImage( "Bedroom_night.png"          );
  Hallway_day            = loadImage( "Hallway_day.png"            );
  Hallway_night          = loadImage( "Hallway_night.png"          );
  Kitchen_day            = loadImage( "Kitchen_day.png"            );
  Kitchen_night          = loadImage( "Kitchen_night.png"          );
  Kitchen_curtain        = loadImage( "Kitchen_curtain.png"        );
  Painting               = loadImage( "Painting.png"               );
  Key1                   = loadImage( "Key_1.png"                  );
  Key2                   = loadImage( "Key_2.png"                  );
  Key3                   = loadImage( "Key_3.png"                  );
  KeyFinal               = loadImage( "Key_final.png"              );
  Magnifying_glass       = loadImage( "Magnifying_glass.png"       );
  Flashlight             = loadImage( "Flashlight.png"             );
  Spider                 = loadImage( "Spider.png"                 );
  Bed                    = loadImage( "Bed.png"                    );
  Chest_closed           = loadImage( "Chest_closed.png"           );
  Chest_open             = loadImage( "Chest_open.png"             );
  Cockroach_left         = loadImage( "Cockroach_left.png"         );
  Cockroach_right        = loadImage( "Cockroach_right.png"        );
  Cockroach_up           = loadImage( "Cockroach_up.png"           );
  Cockroach_down         = loadImage( "Cockroach_down.png"         );
  Cabinet_open_day       = loadImage( "Cabinet_open_day.png"       );
  Cabinet_closed_day     = loadImage( "Cabinet_closed_day.png"     );
  Cabinet_open_night     = loadImage( "Cabinet_open_night.png"     );
  Cabinet_closed_night   = loadImage( "Cabinet_closed_night.png"   );
  Oil                    = loadImage( "Oil.png"                    );
  Inventory              = loadImage( "Inventory.png"              );
  Inventory_small        = loadImage( "Inventory_small.png"        );
  Menu_button_big        = loadImage( "Menu_button_big.png"        );
  Text_bubble_spider     = loadImage( "Text_bubble_spider.png"     );
  Text_bubble_box        = loadImage( "Text_bubble_box.png"        );
  Text_bubble_drain      = loadImage( "Text_bubble_drain.png"      );
  Text_bubble_drain2     = loadImage( "Text_bubble_drain2.png"     );
  Text_bubble_mannequin  = loadImage( "Text_bubble_mannequin.png"  );
  Text_bubble_hallway    = loadImage( "Text_bubble_hallway.png"    );
  Text_bubble_frontdoor  = loadImage( "Text_bubble_front_door.png" );
  Mannequin_whole        = loadImage( "Mannequin_whole.png"        );
  Mannequin_shards       = loadImage( "Mannequin_shards.png"       );
  Hook                   = loadImage( "Hook.png"                   );
  Bathroom_day           = loadImage( "Bathroom_day.png"           );
  Bathroom_night         = loadImage( "Bathroom_night.png"         );
  Letter_hallway_small   = loadImage( "Letter_hallway_small.png"   );
  Letter_hallway_big     = loadImage( "Letter_hallway_big.png"     );
  Letter_kitchen_day     = loadImage( "Letter_kitchen_day.png"     );
  Letter_kitchen_curtain = loadImage( "Letter_kitchen_curtain.png" );
  Letter_start           = loadImage( "Letter_start.png"           );
  QuitLetter             = loadImage( "Quit_button.png"            ); 
  MenuBackground         = loadImage( "MenuBackground.png"         );
  Start                  = loadImage( "Start_button_big.png"       );
  Settings               = loadImage( "Settings_button_big.png"    );
  Credits                = loadImage( "Credits_button_big.png"     );
  Quit                   = loadImage( "Quit_button_big.png"        );
  Kitchen_curtain        = loadImage( "Kitchen_curtain.png"        );
  SettingsBackground     = loadImage( "SettingsBackground.png"     );
  SliderButton           = loadImage( "SliderButton.png"           );
  CreditsBackground      = loadImage( "CreditsBackground.png"      );
  End_game_scene         = loadImage( "End_game_scene.png"         );
  Buttons                = loadImage( "Buttons.png"                );
  Background_letter      = loadImage( "Background_letter.png"      );

  video = new Movie( this, "final_video.mp4" );

  minim = new Minim( this );

  keysSound = minim.loadFile( "Keys.mp3" );

  paintingSound = minim.loadFile( "Painting.mp3" );

  creakDoor = minim.loadFile( "Creak_door.mp3" );

  oilBottle = minim.loadFile( "Oil_bottle.mp3" );

  hiss_spider = minim.loadFile( "Hiss_spider.mp3" );

  cockroach = minim.loadFile( "Cockroach.mp3" );

  bedSound = minim.loadFile( "Bed_sound.mp3" );

  mannequinBreak = minim.loadFile( "Mannequin_break.mp3" );

  backgroundSound = minim.loadFile( "Background_sound.mp3" );
  backgroundSound.loop();

  hoverButton = minim.loadFile( "Hover_button.mp3" );

  clickButton = minim.loadFile( "Click_button.mp3" );

  curtains = minim.loadFile( "Curtains.mp3" );
}


//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


void draw() {
  if ( scene == BEDROOM_DAY_SCENE            ) { 
    scene1();
  } else if ( scene == HALLWAY_DAY_SCENE     ) { 
    scene2();
  } else if ( scene == BEDROOM_NIGHT_SCENE   ) { 
    scene3();
  } else if ( scene == HALLWAY_NIGHT_SCENE   ) { 
    scene4();
  } else if ( scene == KITCHEN_DAY_SCENE     ) { 
    scene5();
  } else if ( scene == KITCHEN_NIGHT_SCENE   ) { 
    scene6();
  } else if ( scene == BATHROOM_DAY_SCENE    ) { 
    scene7();
  } else if ( scene == BATHROOM_NIGHT_SCENE  ) { 
    scene8();
  } else if ( scene == START_MENU_SCENE      ) { 
    scene9();
  } else if ( scene == OPTIONS_MENU_SCENE    ) { 
    scene10();
  } else if ( scene == KITCHEN_CURTAIN_SCENE ) {
    scene11();
  } else if ( scene == END_GAME_SCENE        ) {
    scene12();
  } else if ( scene == CREDITS_MENU_SCENE    ) {
    scene13();
  } else if ( scene == INTRO_SCENE           ) {
    scene14();
  }


  keysSound.setGain      ( map( volume, 0, 9, -30, +30 ) );
  paintingSound.setGain  ( map( volume, 0, 9, -30, +30 ) );
  creakDoor.setGain      ( map( volume, 0, 9, -30, +30 ) );
  oilBottle.setGain      ( map( volume, 0, 9, -30, +30 ) );
  hiss_spider.setGain    ( map( volume, 0, 9, -30, +30 ) );
  cockroach.setGain      ( map( volume, 0, 9, -30, +30 ) );
  bedSound.setGain       ( map( volume, 0, 9, -30, +30 ) );
  mannequinBreak.setGain ( map( volume, 0, 9, -30, +30 ) );
  backgroundSound.setGain( map( volume, 0, 9, -30, +30 ) );
  hoverButton.setGain    ( map( volume, 0, 9, -30, +30 ) );
  clickButton.setGain    ( map( volume, 0, 9, -30, +30 ) );
  curtains.setGain       ( map( volume, 0, 9, -30, +30 ) );

  if ( volume == 0 ) {
    keysSound.mute();
    paintingSound.mute();
    creakDoor.mute();
    oilBottle.mute();
    hiss_spider.mute();
    cockroach.mute();
    bedSound.mute();
    mannequinBreak.mute();
    backgroundSound.mute();
    hoverButton.mute();
    clickButton.mute();
    curtains.mute();
  } else {
    keysSound.unmute();
    paintingSound.unmute();
    creakDoor.unmute();
    oilBottle.unmute();
    hiss_spider.unmute();
    cockroach.unmute();
    bedSound.unmute();
    mannequinBreak.unmute();
    backgroundSound.unmute();
    hoverButton.unmute();
    clickButton.unmute();
    curtains.unmute();
  }

  wasMousePressed = mousePressed;

  inventory();
}


//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


void inventory() {
  if ( scene != START_MENU_SCENE && scene != OPTIONS_MENU_SCENE && scene != CREDITS_MENU_SCENE && scene != END_GAME_SCENE && scene != INTRO_SCENE) {

    image( Inventory, 0, 0 );

    //keys
    if ( isKey1Taken && isKey2Taken && isKey3Taken ) {
      haveAllKeys = true;
    }

    if ( isKey1Taken ) {
      image( Key1, key1X_inventory, key1Y_inventory );
    }

    if ( isKey2Taken ) {
      image( Key2, key2X_inventory, key2Y_inventory );
    }

    if ( isKey3Taken ) {
      image( Key3, key3X_inventory, key3Y_inventory );
    }

    if ( isFinalKeyTaken ) {
      image( KeyFinal, keyFinalX_inventory, keyFinalY_inventory );
    }

    if ( isCockroachTaken ) {
      image( Cockroach_right, cockroachX_inventory, cockroachY_inventory );
    }

    if (isOilTaken ) {
      image( Oil, oilX_inventory, oilY_inventory );
    }

    if ( isHookTaken ) {
      image( Hook, hookX, hookY );
    }

    //menu button
    if ( mousePressed && isPointInCircle( mouseX, mouseY, 459, 839, 50 ) ) {
      scene = START_MENU_SCENE;
      clickButton.play();
      clickButton.rewind();
    }

    //menu button hover
    if ( isPointInCircle( mouseX, mouseY, 459, 839, 50 ) ) {
      image( Menu_button_big, - 5, 11 );
      hoverButton.play();
      hoverButton.rewind();
    }
  }


  //drag cockroach
  if ( dragOil == false && dragHook == false && cockroachIsEaten == false && isCockroachTaken && mousePressed && isPointInRectangle( mouseX, mouseY, 725, 775, 100, 80 ) ) {
    dragCockroach = true;
  }

  //drag cockroach
  if ( isCockroachTaken && ! mousePressed ) {
    dragCockroach = false;
  }

  //drag cockroach
  if ( isCockroachTaken && ! mousePressed && scene == HALLWAY_NIGHT_SCENE && isPointInRectangle( cockroachX_inventory, cockroachY_inventory, spiderX + 508, spiderY + 167, 210, 180 ) ) {
    moveSpider = true;
    hiss_spider.play();
    hiss_spider.rewind();
    hoverSpider = false;
  }

  //drag cockroach
  if ( dragCockroach == true) {
    cockroachX_inventory = mouseX - 40;
    cockroachY_inventory = mouseY - 40;
  }

  //drag cockroach
  if ( hoverSpider && dragCockroach == false ) {
    cockroachX_inventory = 735;
    cockroachY_inventory = 770;
  }



  //drag oil
  if ( dragCockroach == false && oilIsUsed == false && isOilTaken && mousePressed && isPointInRectangle( mouseX, mouseY, 878, 775, 100, 80 ) ) {
    dragOil = true;
  }

  if ( isOilTaken && ! mousePressed ) {
    dragOil = false;
  }

  if ( isOilTaken && ! mousePressed && scene == BEDROOM_DAY_SCENE && isPointInRectangle( oilX_inventory, oilY_inventory, mannequinX + 40, mannequinY + 75, 125, 500 ) ) {
    mannequinX = -1000;
    mannequinY = -1000;
    mannequinBreak.play();
    mannequinBreak.rewind();
    isMannequinInShards = true;
  }

  if ( dragOil == true ) {
    oilX_inventory = mouseX - 15;
    oilY_inventory = mouseY - 37.5;
  }

  if ( isMannequinInShards == false && dragOil == false ) {
    oilX_inventory = 915;
    oilY_inventory = 775;
  }



  //drag hook
  if ( dragCockroach == false && hookIsUsed == false && isHookTaken && mousePressed && isPointInRectangle( mouseX, mouseY, 878, 775, 100, 80 ) ) {
    dragHook = true;
  }

  if ( isHookTaken && ! mousePressed ) {
    dragHook = false;
  }

  if ( isHookTaken == true && ! mousePressed && scene == BATHROOM_NIGHT_SCENE && isPointInRectangle( hookX, hookY, 950, 490, 200, 200 ) ) {
    hookX = -1000;
    hookY = -1000;
    hookIsUsed = true;
    isKey3Taken = true;
    keysSound.play();
    keysSound.rewind();
  }

  if ( dragHook == true ) {
    hookX = mouseX - 25 ;
    hookY = mouseY - 37.5;
  }

  if ( hookIsUsed == false && dragHook == false ) {
    hookX = 905;
    hookY = 772.5;
  }



  //drag final key
  if ( isFinalKeyUsed == false && isFinalKeyTaken == true && mousePressed && isPointInRectangle( mouseX, mouseY, 725, 775, 100, 80 ) ) {
    dragFinalKey = true;
  }

  if ( isFinalKeyTaken && ! mousePressed ) {
    dragFinalKey = false;
  }

  if (isFinalKeyTaken == true && ! mousePressed && scene == HALLWAY_DAY_SCENE && isPointInRectangle( keyFinalX_inventory, keyFinalY_inventory, 768, 181, 190, 350 ) ) {
    scene = END_GAME_SCENE;
    creakDoor.play();
    creakDoor.rewind();
    keyFinalX_inventory = -1000;
    keyFinalY_inventory = -1000;
  }

  if ( dragFinalKey == true ) {
    keyFinalX_inventory = mouseX - 40;
    keyFinalY_inventory = mouseY - 40;
  }

  if ( dragFinalKey == false ) {
    keyFinalX_inventory = 737;
    keyFinalY_inventory = 775.5;
  }
}


//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


void movieEvent(Movie video) {
  video.read();
}


//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


void scene1() {
  image( Bedroom_day, 0, 0                       );
  image( Mannequin_whole, mannequinX, mannequinY );


  //hover above interactable objects
  if ( isPointInRectangle( mouseX, mouseY, 505, 238, 165, 345 ) || isPointInRectangle( mouseX, mouseY, 715, 455, 280, 170  ) || isMannequinInShards == false && isPointInRectangle( mouseX, mouseY, mannequinX + 40, mannequinY + 75, 125, 500) || isPointInRectangle( mouseX, mouseY, 1200, 230, 58, 285 ) ) {
    showMagnifying_glass = true;
  } else {
    showMagnifying_glass = false;
  }


  //Text mannequin
  if ( isMannequinInShards == false &&isPointInRectangle( mouseX, mouseY, mannequinX + 40, mannequinY + 75, 125, 500) ) {
    image(Text_bubble_mannequin, 0, 0 );
  }

  //click on door to hallway
  if ( ! wasMousePressed && mousePressed && isPointInRectangle( mouseX, mouseY, 505, 238, 165, 345 ) ) {
    scene = HALLWAY_DAY_SCENE;
    creakDoor.play();
    creakDoor.rewind();
  }

  //click on door to bathroom
  if ( ! wasMousePressed && mousePressed && isPointInRectangle( mouseX, mouseY, 1200, 230, 58, 285 ) ) {
    scene = BATHROOM_DAY_SCENE;
    creakDoor.play();
    creakDoor.rewind();
  }

  if ( isMannequinInShards ) {
    image(Mannequin_shards, 120, 700 );
    isHookTaken = true;
    oilIsUsed = true;
    oilX_inventory = -1000;
    oilY_inventory = -1000;
  }

  //click on bed
  if ( ! wasMousePressed && mousePressed && isPointInRectangle( mouseX, mouseY, 715, 455, 280, 170  ) ) {
    bedSound.play();
    bedSound.rewind();
    scene = BEDROOM_NIGHT_SCENE;
  }

  if ( showMagnifying_glass ) {
    noCursor();
    image( Magnifying_glass, mouseX - 15, mouseY - 15 );
  }
  if ( showMagnifying_glass == false) {
    cursor();
  }
}


//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


void scene2() {
  image( Hallway_day, 0, 0                                        );
  image( Cabinet_closed_day, cabinetDayClosedX, cabinetDayClosedX );


  //hover above interactable objects
  if ( hoverBigLetter == false && isPointInRectangle( mouseX, mouseY, 1230, 160, 95, 510 ) || hoverBigLetter == false && isPointInRectangle( mouseX, mouseY, 80, 150, 120, 500 ) || isCabinetDayOpen == false && isPointInRectangle( mouseX, mouseY, 485, 155, 190, 170 ) || isLetterTaken == false && isPointInRectangle( mouseX, mouseY, 553, 273, 50, 43 ) || hoverBigLetter && isPointInCircle( mouseX, mouseY, quitX + 50, quitY + 50, 50 ) || hoverBigLetter == false && isPointInRectangle( mouseX, mouseY, 768, 181, 190, 350 ) ) {
    showMagnifying_glass = true;
  } else {
    showMagnifying_glass = false;
  }

  //click on door bedroom
  if ( hoverBigLetter == false && ! wasMousePressed && mousePressed && isPointInRectangle( mouseX, mouseY, 1230, 160, 95, 510 ) ) {
    scene = BEDROOM_DAY_SCENE;
    creakDoor.play();
    creakDoor.rewind();
  }

  if ( isFinalKeyTaken == false && isPointInRectangle( mouseX, mouseY, 768, 181, 190, 350 ) ) {
    image(Text_bubble_frontdoor, 0, 0 );
  }

  //click on letter
  if ( isLetterTaken == false && isCabinetDayOpen && ! wasMousePressed && mousePressed && isPointInRectangle( mouseX, mouseY, 553, 273, 50, 43 ) ) {
    isLetterTaken = true;
    hoverLetter = false;
  }


  //click on door kitchen
  if ( hoverBigLetter == false && ! wasMousePressed && mousePressed && isPointInRectangle( mouseX, mouseY, 80, 150, 120, 500 ) ) {
    scene = KITCHEN_DAY_SCENE;
  }

  //click on cabinet closed 
  if ( isCabinetDayOpen == false && ! wasMousePressed && mousePressed && isPointInRectangle( mouseX, mouseY, 485, 155, 190, 170 ) ) {
    isCabinetDayOpen = true;
    creakDoor.play();
    creakDoor.rewind();
  }

  if ( isCabinetDayOpen ) {
    image( Cabinet_open_day, cabinetDayOpenX, cabinetDayOpenY );
    image( Letter_hallway_small, -10, -10 );
    cabinetDayClosedX = -1000;
    cabinetDayClosedY = -1000;
    hoverLetter = true;
    hoverCabinetDay = false;
  }

  if ( isLetterTaken ) {
    letterX = -10;
    letterY = -10;
    image( Letter_hallway_big, letterX, letterY );
    hoverBigLetter = true;
    image( QuitLetter, quitX, quitY );
  }

  //closes the letter
  if ( isLetterTaken == true && ! wasMousePressed && mousePressed && isPointInCircle( mouseX, mouseY, quitX + 50, quitY + 50, 50 ) ) {
    hoverLetter = true;
    hoverBigLetter = false;
    isLetterTaken = false;
  }

  if ( showMagnifying_glass ) {
    noCursor();
    image( Magnifying_glass, mouseX - 15, mouseY - 15 );
  }
  if ( showMagnifying_glass == false) {
    cursor();
  }
}


//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


void scene3() {

  image( Bedroom_night, 0, 0            );
  image( Key1, key1X, key1Y             );
  image( Painting, paintingX, paintingY );


  //hover above interactable objects
  if ( hoverPainting && isPointInRectangle( mouseX, mouseY, paintingX + 755, paintingY + 135, 120, 148 ) || isPointInRectangle( mouseX, mouseY, 505, 238, 165, 345 ) || isPointInRectangle( mouseX, mouseY, 715, 455, 280, 170  ) || paintingY >= 250 && hoverKey1 && isPointInRectangle( mouseX, mouseY, key1X + 10, key1Y - 3, 55, 80 ) || isPointInRectangle( mouseX, mouseY, 1200, 230, 58, 285 ) ) {
    showFlashlight = true;
  } else {
    showFlashlight = false;
  }

  //click on painting
  if ( paintingSoundPlayed == false && ! wasMousePressed && mousePressed && isPointInRectangle( mouseX, mouseY, paintingX + 755, paintingY + 135, 120, 148 ) ) {
    movePainting = true;
    paintingSound.play();
    paintingSound.rewind();
    paintingSoundPlayed = true;
  }

  //stops painting moving
  if ( paintingY >= 250 ) {
    movePainting = false;
    hoverKey1 = true;
    hoverPainting = false;
  }

  //moves painting
  if ( movePainting ) {
    paintingY = paintingY + 10;
  }

  //click on key
  if ( paintingY >= 250 ) {
    if ( ! wasMousePressed && mousePressed && isPointInRectangle( mouseX, mouseY, key1X + 10, key1Y - 3, 55, 80 ) ) {
      isKey1Taken = true;
      keysSound.rewind();
      keysSound.play();
      key1X = -100;
      key1Y = -100;
      hoverKey1 = false;
    }
  }


  //click on door to bedroom
  if ( ! wasMousePressed && mousePressed && isPointInRectangle( mouseX, mouseY, 505, 238, 165, 345 ) ) {
    scene = HALLWAY_NIGHT_SCENE;
    creakDoor.play();
    creakDoor.rewind();
  }

  //click on door to bathroom
  if ( ! wasMousePressed && mousePressed && isPointInRectangle( mouseX, mouseY, 1200, 230, 58, 285 ) ) {
    scene = BATHROOM_NIGHT_SCENE;
    creakDoor.play();
    creakDoor.rewind();
  }

  //click on bed
  if ( ! wasMousePressed && mousePressed && isPointInRectangle( mouseX, mouseY, 715, 455, 280, 170  ) ) {
    bedSound.play();
    bedSound.rewind();
    scene = BEDROOM_DAY_SCENE;
  }

  if ( showFlashlight ) {
    noCursor();
    image( Flashlight, mouseX - 25, mouseY - 25 );
  }
  if (showFlashlight == false ) {
    cursor();
  }
}


//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


void scene4() {
  image( Hallway_night, 0, 0            );
  image( Cabinet_closed_night, -10, -10 );
  image( Spider, spiderX, spiderY       );


  //hover above interactable objects
  if ( isPointInRectangle( mouseX, mouseY, 1230, 160, 95, 510 ) || isPointInRectangle( mouseX, mouseY, 80, 150, 120, 500 ) || hoverSpider && isPointInRectangle( mouseX, mouseY, spiderX + 508, spiderY + 167, 210, 180 ) || hoverCabinetNight && isPointInRectangle( mouseX, mouseY, 485, 155, 190, 170 ) || hoverKey2 && isPointInRectangle( mouseX, mouseY, key2X + 10, key2Y - 3, 55, 80 ) ) {
    showFlashlight = true;
  } else {
    showFlashlight = false;
  }

  //text spider
  if ( isPointInRectangle( mouseX, mouseY, spiderX + 508, spiderY + 167, 210, 180 ) ) {
    image( Text_bubble_spider, 0, 0 );
  }

  //click on door bedroom
  if ( ! wasMousePressed && mousePressed && isPointInRectangle( mouseX, mouseY, 1230, 160, 95, 510 ) ) {
    scene = BEDROOM_NIGHT_SCENE;
    creakDoor.play();
    creakDoor.rewind();
  }

  //click on door kitchen
  if ( ! wasMousePressed && mousePressed && isPointInRectangle( mouseX, mouseY, 80, 150, 120, 500 ) ) {
    scene = KITCHEN_NIGHT_SCENE;
  }

  if ( spiderY <= -390 ) {
    moveSpider = false;
    hoverCabinetNight = true;
  }

  //moves spider
  if ( moveSpider ) {
    spiderY = spiderY -2;
    cockroachIsEaten = true;
    cockroachX_inventory = -1000;
    cockroachY_inventory = -1000;
  }

  //click on key2
  if (isKey2Taken == false && isCabinetNightOpen && spiderY <= -390 && ! wasMousePressed && mousePressed && isPointInRectangle( mouseX, mouseY, key2X + 10, key2Y - 3, 55, 80 ) ) {
    isKey2Taken = true;
    keysSound.rewind();
    keysSound.play();
    key2X = -100;
    key2Y = -100;
    hoverKey2 = false;
  }

  //click on cabinet closed 
  if (isCabinetNightOpen == false && spiderY <= -390 && ! wasMousePressed && mousePressed && isPointInRectangle( mouseX, mouseY, 485, 155, 190, 170 ) ) {
    isCabinetNightOpen = true;
    creakDoor.play();
    creakDoor.rewind();
  }

  if ( isCabinetNightOpen ) {
    image( Cabinet_open_night, -10, -10 );
    image( Key2, key2X, key2Y );
    hoverKey2 = true;
    hoverCabinetNight = false;
  }

  if ( showFlashlight ) {
    noCursor();
    image( Flashlight, mouseX - 25, mouseY - 25 );
  }
  if (showFlashlight == false ) {
    cursor();
  }
}


//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


void scene5() {
  image( Kitchen_day, 0, 0 );
  image( Chest_closed, 0, 0   );
  image( Oil, oilX, oilY   );


  //hover above interactable objects
  if ( isLetterKitchenTaken == false && isPointInRectangle( mouseX, mouseY, 1200, 80, 130, 670 ) || isLetterKitchenTaken == false && isPointInRectangle( mouseX, mouseY, 340, 427, 115, 50 ) || isLetterKitchenTaken == false && hoverOil == true && isPointInRectangle( mouseX, mouseY, oilX, oilY, 30, 75 ) || isLetterKitchenTaken == false && isPointInRectangle( mouseX, mouseY, 40, 160, 150, 250 ) || isLetterKitchenTaken == false && isPointInRectangle( mouseX, mouseY, 378, 305, 40, 45 ) || isLetterKitchenTaken == true && isPointInCircle( mouseX, mouseY, quit2X + 50, quit2Y + 50, 50 )) {
    showMagnifying_glass = true;
  } else {
    showMagnifying_glass = false;
  }

  //switch to kitchen curtain scene
  if ( isLetterKitchenTaken == false && ! wasMousePressed && mousePressed && isPointInRectangle( mouseX, mouseY, 40, 160, 150, 250 ) ) {
    scene = KITCHEN_CURTAIN_SCENE;
    curtains.play();
    curtains.rewind();
  }

  //click on door to hallway
  if ( isLetterKitchenTaken == false && ! wasMousePressed && mousePressed && isPointInRectangle( mouseX, mouseY, 1200, 80, 130, 670 ) ) {
    scene = HALLWAY_DAY_SCENE;
  }

  //click on letter
  if ( isLetterKitchenTaken == false && ! wasMousePressed && mousePressed && isPointInRectangle( mouseX, mouseY, 378, 305, 40, 45 ) ) {
    isLetterKitchenTaken = true;
  }

  if ( isLetterKitchenTaken ) {
    image( Letter_kitchen_day, 0, -90 );
    image( QuitLetter, quit2X, quit2Y );
  }

  //closes the letter
  if ( isLetterKitchenTaken == true && ! wasMousePressed && mousePressed && isPointInCircle( mouseX, mouseY, quit2X + 50, quit2Y + 50, 50 ) ) {
    isLetterKitchenTaken = false;
  }


  //click on oil
  if ( isLetterKitchenTaken == false && isOilTaken == false && ! wasMousePressed && mousePressed && isPointInRectangle( mouseX, mouseY, oilX, oilY, 30, 75 ) ) {
    isOilTaken = true;
    oilBottle.play();
    oilBottle.rewind();
    oilX = -100;
    oilY = -100;
    hoverOil = false;
  }

  //Text Chest_closed
  if ( isLetterKitchenTaken == false && haveAllKeys == false && isPointInRectangle( mouseX, mouseY, 340, 427, 115, 50 ) ) {
    image( Text_bubble_box, 0, 0 );
  }

  if ( ! wasMousePressed && mousePressed && haveAllKeys == true && isPointInRectangle( mouseX, mouseY, 340, 427, 115, 50 ) ) {
    chestOpened = true;
  }

  if ( chestOpened ) {
    image( Chest_open, 0, 0 );
    key1X_inventory = - 1000;
    key1Y_inventory = - 1000;
    key2X_inventory = - 1000;
    key2Y_inventory = - 1000;
    key3X_inventory = - 1000;
    key3Y_inventory = - 1000;
    isFinalKeyTaken = true;
  }

  if ( showMagnifying_glass ) {
    noCursor();
    image( Magnifying_glass, mouseX - 15, mouseY - 15 );
  }
  if ( showMagnifying_glass == false) {
    cursor();
  }
}


//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


void scene6() {
  image( Kitchen_night, 0, 0 );

  //hover above interactable objects
  if ( isPointInRectangle( mouseX, mouseY, 1200, 80, 130, 670 ) || isCockroachTaken == false && ! wasMousePressed && isPointInRectangle( mouseX, mouseY, cockroachX, cockroachY, 134, 115 ) ) {
    showFlashlight = true;
  } else {
    showFlashlight = false;
  }

  //click on door to hallway
  if ( ! wasMousePressed && mousePressed && isPointInRectangle( mouseX, mouseY, 1200, 80, 130, 670 ) ) {
    scene = HALLWAY_NIGHT_SCENE;
  }

  if ( showFlashlight ) {
    noCursor();
    image( Flashlight, mouseX - 25, mouseY - 25 );
  }
  if (showFlashlight == false ) {
    cursor();
  }
}


//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


void scene7() {
  image( Bathroom_day, 0, 0 );


  //hover above interactable objects
  if ( isPointInRectangle( mouseX, mouseY, 83, 188, 93, 480 ) || hookIsUsed == false && isPointInRectangle( mouseX, mouseY, 1065, 603, 48, 15 ) ) {
    showMagnifying_glass = true;
  } else {
    showMagnifying_glass = false;
  }

  //Text drain 
  if ( hookIsUsed == false && isPointInRectangle( mouseX, mouseY, 1065, 603, 48, 15 ) ) {
    image( Text_bubble_drain2, 0, 0 );
  }

  //click on door to bedroom
  if ( ! wasMousePressed && mousePressed && isPointInRectangle( mouseX, mouseY, 83, 188, 93, 480 ) ) {
    scene = BEDROOM_DAY_SCENE;
    creakDoor.play();
    creakDoor.rewind();
  }

  if ( showMagnifying_glass ) {
    noCursor();
    image( Magnifying_glass, mouseX - 15, mouseY - 15 );
  }
  if ( showMagnifying_glass == false) {
    cursor();
  }
}


//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


void scene8() {
  image( Bathroom_night, 0, 0 );

  //hover above interactable objects
  if ( isPointInRectangle( mouseX, mouseY, 83, 188, 93, 480 ) || hookIsUsed == false && isPointInRectangle( mouseX, mouseY, 1065, 603, 48, 15 ) ) {
    showFlashlight = true;
  } else {
    showFlashlight = false;
  }

  //Text drain 
  if ( hookIsUsed == false && isPointInRectangle( mouseX, mouseY, 1065, 603, 48, 15 ) ) {
    image( Text_bubble_drain, 0, 0 );
  }

  //click on door to bedroom
  if ( ! wasMousePressed && mousePressed && isPointInRectangle( mouseX, mouseY, 83, 188, 93, 480 ) ) {
    scene = BEDROOM_NIGHT_SCENE;
    creakDoor.play();
    creakDoor.rewind();
  }

  if ( showFlashlight ) {
    noCursor();
    image( Flashlight, mouseX - 25, mouseY - 25 );
  }
  if (showFlashlight == false ) {
    cursor();
  }
}


//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


void scene9() {
  //starting screen
  image( MenuBackground, 0, 0 );

  cursor();

  //start button
  if ( mousePressed && isPointInRectangle ( mouseX, mouseY, 450, 255, 500, 82 ) ) {
    scene = INTRO_SCENE;
    clickButton.play();
    clickButton.rewind();
  }

  //start button hover
  if ( isPointInRectangle ( mouseX, mouseY, 450, 255, 500, 82 ) ) {
    image( Start, 0, 0 );
    hoverSound = true;
  }

  //options button
  if ( mousePressed && isPointInRectangle ( mouseX, mouseY, 450, 352, 500, 82 ) ) {
    scene = OPTIONS_MENU_SCENE;
    clickButton.play();
    clickButton.rewind();
  }

  //options button hover
  if ( isPointInRectangle ( mouseX, mouseY, 450, 352, 500, 82 ) ) {
    image( Settings, 0, 0 );
    hoverSound = true;
  }

  //credits button
  if ( mousePressed && isPointInRectangle ( mouseX, mouseY, 450, 450, 500, 82 ) ) {
    scene = CREDITS_MENU_SCENE;
    clickButton.play();
    clickButton.rewind();
  }

  //credits button hover
  if ( isPointInRectangle ( mouseX, mouseY, 450, 450, 500, 82 ) ) {
    image( Credits, 0, 0 );
    hoverSound = true;
  }

  //quit button
  if ( mousePressed && isPointInRectangle ( mouseX, mouseY, 450, 551, 500, 82 ) ) {
    exit();
    clickButton.play();
    clickButton.rewind();
  }

  //quit button hover
  if ( isPointInRectangle ( mouseX, mouseY, 450, 551, 500, 82 ) ) {
    image( Quit, 0, 0 );
    hoverSound = true;
  }

  if ( hoverSound ) {
    hoverButton.play();
    hoverButton.rewind();
    hoverSound = false;
  }
}


//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


void scene10() {

  image( SettingsBackground, 0, 0 );

  cursor();

  //volumebutton movement
  if ( mousePressed && isPointInCircle( mouseX, mouseY, volX, volY, 35 )) {
    volX = mouseX;
  }

  //volume adjustment
  if ( volX >= 500 && volX <= 539 ) {
    volume = 0;
  }

  if ( volX >= 540 && volX <= 579 ) {
    volume = 1;
  }

  if ( volX >= 580 && volX <= 619 ) {
    volume = 2;
  }

  if ( volX >= 620 && volX <= 659 ) {
    volume = 3;
  }

  if ( volX >= 660 && volX <= 699 ) {
    volume = 4;
  }

  if ( volX >= 700 && volX <= 739 ) {
    volume = 5;
  }

  if ( volX >= 740 && volX <= 779 ) {
    volume = 6;
  }

  if ( volX >= 780 && volX <= 819 ) {
    volume = 7;
  }

  if ( volX >= 820 && volX <= 859 ) {
    volume = 8;
  }

  if ( volX >= 860 && volX <= 900 ) {
    volume = 9;
  }

  //volumebutton
  image( SliderButton, volX - 35, volY - 45 );

  volX = constrain( volX, 500, 900 );

  //back button
  if ( mousePressed && isPointInRectangle ( mouseX, mouseY, 235, 240, 185, 185 ) ) {
    scene = START_MENU_SCENE;
    clickButton.play();
    clickButton.rewind();
  }

  //back button hover sound
  if ( isPointInRectangle ( mouseX, mouseY, 235, 240, 185, 185 ) ) {
    hoverButton.play();
    hoverButton.rewind();
  }
}


//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


void scene11() {

  image( Kitchen_curtain, 0, 0 );
  image( Oil, oilX, oilY   );
  image( Chest_closed, 0, 0   );


  //hover above interactable objects
  if ( isLetterKitchenTaken == false && isPointInRectangle( mouseX, mouseY, 1200, 80, 130, 670 ) || isLetterKitchenTaken == false && isPointInRectangle( mouseX, mouseY, cockroachX, cockroachY + 20, 70, 50 ) || isLetterKitchenTaken == false && isPointInRectangle( mouseX, mouseY, 340, 427, 115, 50 ) || isLetterKitchenTaken == false && hoverOil == true && isPointInRectangle( mouseX, mouseY, oilX, oilY, 30, 75 ) || isLetterKitchenTaken == false && isPointInRectangle( mouseX, mouseY, 40, 160, 150, 250 ) || isLetterKitchenTaken == false && isPointInRectangle( mouseX, mouseY, 378, 305, 40, 45 ) || isLetterKitchenTaken == true && isPointInRectangle( mouseX, mouseY, quit2X, quit2Y, 100, 100 ) ) {
    showFlashlight = true;
  } else {
    showFlashlight = false;
  }


  //click on oil
  if ( isLetterKitchenTaken == false && isOilTaken == false && ! wasMousePressed && mousePressed && isPointInRectangle( mouseX, mouseY, oilX, oilY, 30, 75 ) ) {
    isOilTaken = true;
    oilBottle.play();
    oilBottle.rewind();
    oilX = -100;
    oilY = -100;
    hoverOil = false;
  }

  //click on curtain
  if ( ! wasMousePressed && mousePressed && isPointInRectangle( mouseX, mouseY, 40, 160, 150, 250 ) ) {
    scene = KITCHEN_DAY_SCENE;
    curtains.play();
    curtains.rewind();
  }

  //cockroach moving
  //left to right
  if ( cockroachX < width - 250 && cockroachY == 660 ) {
    image( Cockroach_right, cockroachX, cockroachY );
    cockroachX = cockroachX + 5;
  }

  //top to bottom
  if ( cockroachX == width - 250 && cockroachY <= height - 225 ) {
    image( Cockroach_down, cockroachX, cockroachY );
    cockroachY = cockroachY + 5;
  }

  //right to left
  if ( cockroachY == height - 225 ) {
    image( Cockroach_left, cockroachX, cockroachY );
    cockroachX = cockroachX - 5;
  }

  //bottom to top
  if ( cockroachX == 300 && cockroachY > 660 ) {
    image( Cockroach_up, cockroachX, cockroachY );
    cockroachY = cockroachY - 5;
  }

  //click on letter
  if ( isLetterKitchenTaken == false && ! wasMousePressed && mousePressed && isPointInRectangle( mouseX, mouseY, 378, 305, 40, 45 ) ) {
    isLetterKitchenTaken = true;
  }

  if ( isLetterKitchenTaken ) {
    image( Letter_kitchen_curtain, 0, -90 );
    image( QuitLetter, quit2X, quit2Y );
  }

  if ( isLetterKitchenTaken == true && ! wasMousePressed && mousePressed && isPointInRectangle( mouseX, mouseY, quit2X, quit2Y, 100, 100 ) ) {
    isLetterKitchenTaken = false;
  }

  //Text door to hallway
  if (isLetterKitchenTaken == false &&  isPointInRectangle( mouseX, mouseY, 1200, 80, 130, 670 ) ) {
    image(Text_bubble_hallway, 0, 0 );
  }

  //Text chest_closed
  if ( isLetterKitchenTaken == false && haveAllKeys == false && isPointInRectangle( mouseX, mouseY, 340, 427, 115, 50 ) ) {
    image( Text_bubble_box, 0, 0 );
  }

  //click on cockroach
  if ( isLetterKitchenTaken == false && isCockroachTaken == false && ! wasMousePressed && mousePressed && isPointInRectangle( mouseX, mouseY, cockroachX, cockroachY, 134, 115 ) ) {
    cockroach.play();
    cockroach.rewind();
    cockroachX = -1000;
    cockroachY = -1000;
    isCockroachTaken = true;
  }

  if ( ! wasMousePressed && mousePressed && haveAllKeys == true && isPointInRectangle( mouseX, mouseY, 340, 427, 115, 50 ) ) {
    chestOpened = true;
  }

  if ( chestOpened ) {
    image( Chest_open, 0, 0 );
    key1X_inventory = - 1000;
    key1Y_inventory = - 1000;
    key2X_inventory = - 1000;
    key2Y_inventory = - 1000;
    key3X_inventory = - 1000;
    key3Y_inventory = - 1000;
    isFinalKeyTaken = true;
  }

  if ( showFlashlight ) {
    noCursor();
    image( Flashlight, mouseX - 25, mouseY - 25 );
  }
  if (showFlashlight == false ) {
    cursor();
  }
}


//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


void scene12() {
  image( End_game_scene, 0, 0 );
  image (Inventory_small, 0, 0 );

  cursor();

  //menu button
  if ( mousePressed && isPointInCircle( mouseX, mouseY, 701, 840, 30 ) ) {
    scene = START_MENU_SCENE;
    clickButton.play();
    clickButton.rewind();
  }

  //menu button hover
  if ( isPointInCircle( mouseX, mouseY, 701, 840, 30 ) ) {
    image( Menu_button_big, 237, 15 );
    hoverButton.play();
    hoverButton.rewind();
  }
}


//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


void scene13() {
  image( CreditsBackground, 0, 0 );

  cursor();

  //back button
  if ( mousePressed && isPointInRectangle ( mouseX, mouseY, 235, 240, 185, 185 ) ) {
    scene = START_MENU_SCENE;
    clickButton.play();
    clickButton.rewind();
  }

  //back button hover sound
  if ( isPointInRectangle ( mouseX, mouseY, 235, 240, 185, 185 ) ) {
    hoverButton.play();
    hoverButton.rewind();
  }
}


//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


void scene14() {

  image( Background_letter, 0, 0 );

  cursor();
  image( Letter_start, 0, 0 );

  image( Buttons, 1000, 720 );

  //hover sound
  if ( isPointInRectangle( mouseX, mouseY, 1220, 795, 125, 85) || isPointInCircle( mouseX, mouseY, 1116, 845, 70 ) ) {
    hoverButton.play();
    hoverButton.rewind();
  }

  //click sound
  if ( mousePressed && isPointInRectangle( mouseX, mouseY, 1220, 795, 125, 85) || mousePressed && isPointInCircle( mouseX, mouseY, 1116, 845, 70 ) ) {
    clickButton.play();
    clickButton.rewind();
  }

  if ( mousePressed && isPointInCircle( mouseX, mouseY, 1116, 845, 70 ) ) {
    scene = START_MENU_SCENE;
  }

  //click
  if ( mousePressed && isPointInRectangle( mouseX, mouseY, 1220, 795, 125, 85 ) ) {
    playerHitsButton = true;
  }

  if ( playerHitsButton ) {
    noCursor();

    image( video, 0, 0 );
    video.play();

    if (video.time() >= 29) {
      scene = HALLWAY_DAY_SCENE;
    }
  }
}


//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


// http://www.jeffreythompson.org/collision-detection/point-rect.php
// POINT/RECTANGLE
boolean isPointInRectangle(float px, float py, float rx, float ry, float rw, float rh) {

  // is the point inside the rectangle's bounds?
  if (px >= rx &&        // right of the left edge AND
    px <= rx + rw &&   // left of the right edge AND
    py >= ry &&        // below the top AND
    py <= ry + rh) {   // above the bottom
    return true;
  }
  return false;
}


//https://www.jeffreythompson.org/collision-detection/point-circle.php
// POINT/CIRCLE
boolean isPointInCircle(float px, float py, float cx, float cy, float r) {

  // get distance between the point and circle's center
  // using the Pythagorean Theorem
  float distX = px - cx;
  float distY = py - cy;
  float distance = sqrt( (distX*distX) + (distY*distY) );

  // if the distance is less than the circle's
  // radius the point is inside!
  if (distance <= r) {
    return true;
  }
  return false;
}
