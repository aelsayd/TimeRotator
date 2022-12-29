dot[] x;
public void setup()
{
	size(500,500);
	background(#10151a);
	x = new dot[40];
	for(int i = 0; i < x.length; i++)
		x[i] = new dot(new Vector(random(width), random(height)));
	x[0].pos = new Vector(252,252);
}

int rate = 15;
int count = 0;
public void draw()
{
	count++;
	if(count % 100 == 0 && !(rate < 0))
	{
		rate--;
	}
	//background(#10151a);
	
	for(int i = 0; i < x.length; i++)
	{
		for(int j = 0; j < rate; j++)
		{
			for(int q = 0; q < 1; q++)
			{
				x[i].setV();	
				x[i].update();
			}
			x[i].show(count);
		}
	}


}

public class dot
{
	Vector pos;
	Vector velocity;	
	int def_size = 3;
	int size = def_size;
	public dot(Vector pos)
	{
		this.pos = pos;		
		this.velocity = new Vector(0,0);
	}

	public void setV()
	{
		//cheap fix
		//for now, update velocity based on position
		//vector field is [x-a, y-b] x = 200 = y
		//velocity.x = random(400) - pos.x;
		//velocity.y = random(410) - pos.y;
		Vector temp = pos.copy();
		pos.x = 250 - pos.x;
		pos.y = 250 - pos.y;
		velocity.x = -pos.y/(pos.x*pos.x + pos.y*pos.y);
		velocity.y = pos.x/(pos.x*pos.x + pos.y*pos.y);
		
		//velocity.add(new Vector(random(0.013), random(0.013)));
		
		//velocity.setMag(0.1);
		velocity.mult(7);		
		
		if(mousePressed == true)
		{
			velocity.mult(-1);
		}
		pos = temp;
	}
	public void update()
	{
		pos.add(velocity);
	}

	public void show(int count)
	{
		fill(count,floor((float)pos.y),255);	
		if(mousePressed == true)
		{
			size = def_size+3;
			fill(#10151a);
		}
		else
		{
			size = def_size;
		}
		noStroke();
		ellipse((float)pos.x, (float)pos.y, size, size);
	}
}

public class Vector
{
	//pvector ripoff with doubles
	double x;
	double y;
	public Vector(double x, double y)
	{
		this.x = x;
		this.y = y;
	}

	public void add(Vector v)
	{
		this.x += v.x;
		this.y += v.y;
	}
	
	public void mult(double v)
	{
		this.x *= v;
		this.y *= v;
	}

	public void setMag(double v)
	{
		float modulo = sqrt((float)(this.x*this.x) + (float)(this.y*this.y)); 
		this.x /= modulo/v;
		this.y /= modulo/v;
	}
	
	public Vector copy()
	{
		return new Vector(this.x, this.y);
	}


}




