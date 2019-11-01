//your code here
Particle[] bob;
void setup()
{
	size(600, 600);
	colorMode(HSB);
	background(0, 0, 0);
	bob = new Particle[0];
	for(int i = 0; i < bob.length; i++)
		{}//bob[i] = new Particle();
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
	//bob = (Particle[])(append(bob, new Particle()));
	if(Math.random() < 1.03){
		bob = (Particle[])(append(bob, new OddballParticle()));
	}
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
		fill(hue, 90, bright);
		rect(myX, myY, 5, 5);
	}
}

class OddballParticle extends Particle
{
	float s;
	OddballParticle() 
	{
		myX = width / 2;
		myY = height / 2;
		angle = (float)(Math.random() * 2 * PI);
		mov = (float)(Math.random() ) + 1;
		s = 10;

	}

	void draw()
	{
		s *= 1.07;
		int bright = (int)(dist(myX, myY, width / 2,  height / 2) / 2 );
		if (bright > 180)
			bright = 180;
		fill(0, 30, bright);

ellipseMode(CORNER);
		ellipse(myX, myY, s, s);
		fill(0, 0, bright /02);
		ellipse(myX, myY + 30 , s,s);
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