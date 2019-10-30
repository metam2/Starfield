//your code here
Particle[] bob;
void setup()
{
	size(600, 600);
	colorMode(HSB);
	background(0, 0, 0);
	bob = new Particle[30];
	for(int i = 0; i < bob.length; i++)
		bob[i] = new Particle();
	frameRate(30);
}

void draw()
{
	//your code here
	for(int i = 0; i < bob.length; i++)
	{
	bob[i].move();
	bob[i].draw();
	}
}
class Particle
{
	int myX, myY, hue;
	float angle, accel, mov;
	Particle()
	{
		myX = width / 2;
		myY = height / 2;
		hue = (int)(Math.random() * 255);
		angle = (float)(Math.random() * 2 * PI);
		accel = (float)(Math.random() * 0.2) + 1;
		mov = 1.03;
	}

	void move()
	{
		myX += (int)(cos(angle) * mov );
		myY += (int)(sin(angle) * mov );
		mov *= 1.1;
		System.out.println(mov);

	}

	void draw()
	{
		int bright = (int)(dist(myX, myY, width / 2,  height / 2) );
		System.out.println(bright);
		fill(hue, 20, bright);
		rect(myX, myY, 5, 5);
	}
}

class OddballParticle //inherits from Particle
{
	//your code here
}


