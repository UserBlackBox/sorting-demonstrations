int count = 50; //number of items, maximum is 600
int[] items = new int[count]; //storage array
boolean started = false; //wait for space bar
int comparisons = 0; //action counter variables
int accesses = 0;
int i=0; //loop variables
int j=0;
int unsorted = items.length; //unsorted array size
int temp = 0; //temporary variable for swapping operation
boolean swapped = false; //did the algo swap on this iteration
long startFrame = 0; //algorithm starting frame number
boolean swapping = false;
PFont font_14, font_18; //font assets

void settings(){ //processing settings
    size(850,400); //set window size, DO NOT CHANGE
}

void setup(){ //setup program
    surface.setTitle("Bubble Sort Demonstration");
    background(255, 255, 255);
    frameRate(60); //actions per second
    for(int n=0;n<count;n++) items[n] = (int) random(1,50);
    for(int n=0;n<count-1;n++) print(items[n] + ",");
    println(items[count-1]);

    font_14 = loadFont("Graph-14.vlw"); //loading assets
    font_18 = loadFont("Graph-18.vlw");

    clear();
    drawFrame();
    draw();
}

void draw(){ //loop
    if(started==true){ //if algorithm started
        if(i<count){
            if(j<count-i-1){
                if(swapping==false && items[j]>items[j+1]){
                    swapping = true;
                    drawFrame();
                    fill(#ffa500); //highlight pointer
                    rect(205+j*(600/count),360,(600/count),-items[j]*6);    
                    rect(205+(j+1)*(600/count),360,(600/count),-items[j+1]*6);
                    accesses+=2;
                    comparisons+=1;
                    textFont(font_14);
                    textSize(14);
                    fill(255);
                    text("Item at index "+j+" is\nlarger than index "+(j+1),5,200);
                }
                else if(swapping==true){
                    temp = items[j];
                    items[j] = items[j+1];
                    items[j+1] = temp;
                    drawFrame();
                    fill(#ffa500); //highlight pointer
                    rect(205+j*(600/count),360,(600/count),-items[j]*6);    
                    rect(205+(j+1)*(600/count),360,(600/count),-items[j+1]*6);
                    j++;
                    accesses+=2;
                    swapped=true;
                    swapping=false;
                    textFont(font_14);
                    textSize(14);
                    fill(255);
                    text("Swpping indexes "+j+"\nand "+(j+1),5,200);
                }
                else{
                    j++;
                    drawFrame();
                    fill(#ffa500); //highlight pointer
                    rect(205+j*(600/count),360,(600/count),-items[j]*6);    
                    rect(205+(j+1)*(600/count),360,(600/count),-items[j+1]*6);  
                    comparisons+=1;
                    textFont(font_14);
                    textSize(14);
                    fill(255);
                    text("Item at index "+j+" is\nnot larger than index "+(j+1),5,200);
                }
            }
            else{
                if(swapped==false){
                    i=count;
                }
                j=0;
                i++;
                swapped = false;
            }
        }
        else{
            drawFrame();
            for(int i=0;i<count;i++){
                fill(#61bb78);
                strokeWeight(0);
                rect(205+i*(600/count),360,(600/count),-items[i]*6);
                
            }
            textFont(font_14);
            textSize(14);
            fill(255);
            text("Completed execution after\n" + (frameCount-startFrame)/frameRate + " seconds",5,200);  
            noLoop();
            for(int i=0;i<count-1;i++) print(items[i] + ",");
            println(items[count-1]);
            println("Comparisons:",comparisons);
            println("Array Access:",accesses);
        }
    }if(started==false){
        drawFrame();
        if(keyPressed==true && key==' '){
            started=true;
            startFrame = frameCount;
        }
    }
}

void drawFrame(){
    strokeWeight(1);
    background(238);
    fill(0);
    stroke(0);
    rect(0,0,180,400);
    rect(0,380,850,20);
    rect(0,0,850,20);
    rect(830,0,20,400);
    strokeWeight(2);
    for(int i=0;i<count;i++){
        fill(#add8e6);
        strokeWeight(0);
        rect(205+i*(600/count),360,(600/count),-items[i]*6);
    }
    fill(255);
    textFont(font_18);
    textSize(18);
    text("Bubble Sort", 5, 20);
    stroke(255);
    strokeWeight(1);
    line(5,28,175,28);
    stroke(0);
    textFont(font_14);
    textSize(14);
    text("n: " + count,5,46);
    text("Worst - O(n^2): " + (int)pow(count,2),5,64);
    text("Average - O(n^2): " + (int)pow(count,2),5,82);
    text("Best - O(n): " + count,5,100);
    text("Array Accesses: " + accesses,5,118);
    text("Comparrisons: " + comparisons,5,136);
    strokeWeight(0);
}
