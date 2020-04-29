int count = 50;
int[] items = new int[count];
boolean started = false;
int comparisons = 0;
int accesses = 0;
int i=0;
int j=0;
int unsorted = items.length;
int temp = 0;
int min = 0;
long startFrame = 0;
PFont font_14, font_18;

void settings(){
    size(850,400);
}

void setup(){
    surface.setTitle("Selection Sort Demonstration");
    background(255, 255, 255);
    frameRate(60);
    for(int n=0;n<count;n++) items[n] = (int) random(1,50);
    for(int n=0;n<count-1;n++) print(items[n] + ",");
    println(items[count-1]);

    font_14 = loadFont("Graph-14.vlw");
    font_18 = loadFont("Graph-18.vlw");

    clear();
    drawFrame();
    draw();
}

void draw(){
    if(started==true){
        clear();
        if(i<count){
            if(j<unsorted){
                if(items[j]<items[min]) min=j;
                comparisons++;
                accesses++;
                drawFrame();
                for(int n=0;n<i;n++){ //highlight sorted half
                    fill(#61bb78);
                    strokeWeight(0);
                    rect(205+n*(600/count),360,(600/count),-items[n]*6);
                }
                fill(#ffa500); //highlight pointer
                rect(205+j*(600/count),360,(600/count),-items[j]*6);
                fill(#b51405); //highlight min
                rect(205+min*(600/count),360,(600/count),-items[min]*6);
                fill(255);
                textFont(font_14);
                textSize(14);
                text("Scanning for integer\nsmaller than "+items[min]+" at index "+min,5,200);
                j++;
            }
            else if(j==unsorted){
                drawFrame();
                if(min!=i){ //swap if not already in place
                    temp = items[min];
                    items[min] = items[i];
                    items[i] = temp;
                    accesses+=2;
                    fill(255);
                    textFont(font_14);
                    textSize(14);
                    text("Swapping indicies "+i+" and\n"+min,5,200);
                }
                else{
                    textFont(font_14);
                    textSize(14);
                    fill(255);
                    text("Adding index "+i+" to sorted half",5,200);  
                }
                for(int n=0;n<i;n++){ //highlight sorted half
                    fill(#61bb78);
                    strokeWeight(0);
                    rect(205+n*(600/count),360,(600/count),-items[n]*6);
                }
                i++;
                j=i+1;
                min=i;
            }
        }
        else if(i==count){
            drawFrame();
            for(int n=0;n<i;n++){ //highlight sorted half
                fill(#61bb78);
                strokeWeight(0);
                rect(205+n*(600/count),360,(600/count),-items[n]*6);
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
    text("Selection Sort", 5, 20);
    stroke(255);
    strokeWeight(1);
    line(5,28,175,28);
    stroke(0);
    textFont(font_14);
    textSize(14);
    text("n: " + count,5,46);
    text("Max - O(n^2): " + (int)pow(count,2),5,64);
    text("Array Accesses: " + accesses,5,82);
    text("Comparrisons: " + comparisons,5,100);
    strokeWeight(0);
}