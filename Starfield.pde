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
	fill(0,0,0);
	rect(0, 0, width, height);
	bob = rmvParticle(bob);
	for(int i = 0; i < bob.length; i++)
	{
	bob[i].move();
	bob[i].draw();
	}
	bob = (Particle[])(append(bob, new Particle()));
	if(Math.random() < 0.03)
		bob = (Particle[])(append(bob, new OddballParticle()));
}
class Particle
{
	int myX, myY, hue;
	float angle, mov;
	Particle()
	{
		myX = width / 2;
		myY = height / 2;
		hue = (int)(Math.random() * 255);
		angle = (float)(Math.random() * 2 * PI);
		mov = (float)(Math.random() ) + 1;
	}

	void move()
	{
		myX += (int)(cos(angle) * mov );
		myY += (int)(sin(angle) * mov );
		mov *= 1.1;

	}

	void draw()
	{
		int bright = (int)(dist(myX, myY, width / 2,  height / 2) );
		fill(hue, 20, bright);
		rect(myX, myY, 5, 5);
	}
}

class OddballParticle extends Particle
{
	PImage img;
	String imgName;
	float s;
	OddballParticle() 
	{
		myX = width / 2;
		myY = height / 2;
		angle = (float)(Math.random() * 2 * PI);
		mov = (float)(Math.random() ) + 1;
		//img = 
		s = 10;
		float chance = (float)(Math.random());
		if(chance < 0.25)
			imgName = "ship1.png";
		else if(chance < 0.5)
			imgName = "ship2.png";
		else if(chance < 0.75)
			imgName = "asteroid.png";
		else 
			imgName = "planet.png";

	}

	void draw()
	{
		s *= 1.07;
		int bright = (int)(dist(myX, myY, width / 2,  height / 2) );
		fill(hue, 20, bright);
		//rect(myX, myY, 10 * pow(0.5, 300 - dist(myX, myY, width / 2,  height / 2)), 10 * pow(0.5, 300 - dist(myX, myY, width / 2,  height / 2)));
		img = loadImage(imgName);
		img.resize((int)s,(int)s);
		image(img, myX, myY);
	}
}


Particle[] rmvParticle(Particle[] bob)
{
	Particle[] arr = {};
	for(int i = 0; i < bob.length; i++)
	{
		if(!(bob[i].myX < -50 || bob[i].myX > width || bob[i].myY < -50 || bob[i].myY > height))
		{
			arr = (Particle[])(append(arr, bob[i]));
		}
	}
	return arr;
}