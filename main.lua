display.setStatusBar( display.HiddenStatusBar )


local ancho = display.contentWidth
local alto = display.contentHeight


local velocidad = 12
local aumento = velocidad / 2
local score = 0

local fondo = display.newRect( 0, 0, ancho, alto )
fondo.x = ancho / 2
fondo.y = alto / 2

local cambio = display.newGroup()

local trasArriba = display.newImageRect( "rojo.png",400,500)
trasArriba.x = ancho/2 + 25
trasArriba.y = 100
local trasAbajo = display.newImageRect( "azul.png",400,500)
trasAbajo.x = ancho/2 -25
trasAbajo.y = alto - 100
trasAbajo.rotation = 180
local trasDerecha = display.newImageRect( "verde.png",400,500)
trasDerecha.x = 220
trasDerecha.y = alto/2 - 20
trasDerecha.rotation = -90
local trasIzquierda = display.newImageRect( "amarillo.png",400,500 )
trasIzquierda.x = ancho - 220 
trasIzquierda.y = alto / 2   + 25
trasIzquierda.rotation = 90

cambio:insert(trasIzquierda)
cambio:insert(trasDerecha)
cambio:insert(trasAbajo)
cambio:insert(trasArriba)

local cuadrado = display.newRect(0,0,30,30)
cuadrado.x = ancho/2 
cuadrado.y = alto / 2
cuadrado:setFillColor( 0,1,0)

local cuadrado2 = display.newRect( 0, 0, 30, 30 )
cuadrado2.x = ancho / 2
cuadrado2.y = alto  / 2
cuadrado2:setFillColor(0,1,0)

local cuadrado3 = display.newRect(0,0,30,30)
cuadrado3.x = ancho/2 
cuadrado3.y = alto / 2
cuadrado3:setFillColor( 0,1,0)

local cuadrado4 = display.newRect( 0, 0, 30, 30 )
cuadrado4.x = ancho / 2
cuadrado4.y = alto  / 2
cuadrado4:setFillColor(0,1,0)

local circulo = display.newCircle( 0, 0, 70 )
circulo.x = ancho / 2
circulo.y = alto / 2
circulo:setFillColor( 0,0,0 )

local scoreText = display.newText("Score: "..score,0,0,native.systemFont,50)
scoreText.x = 150
scoreText.y = 30
scoreText:setFillColor( 0.5,1,0.5 )

function moverCua(event)
	cuadrado.width = cuadrado.width + aumento
	cuadrado.height = cuadrado.height + aumento

	cuadrado.y = cuadrado.y + velocidad

	if cuadrado.y > ancho - 30 then
		cuadrado.width = 30
		cuadrado.height = 30

		cuadrado.y = alto / 2
	end

	cuadrado2.width = cuadrado2.width + aumento
	cuadrado2.height = cuadrado2.height + aumento

	cuadrado2.x = cuadrado2.x + velocidad

	if cuadrado2.x > ancho + 100 then
		cuadrado2.width = 30
		cuadrado2.height = 30

		cuadrado2.x = ancho / 2
	end

	cuadrado3.width = cuadrado3.width + aumento
	cuadrado3.height = cuadrado3.height + aumento

	cuadrado3.y = cuadrado3.y - velocidad 

	if cuadrado3.y < -230  then

		cuadrado3.width = 30
		cuadrado3.height = 30

		cuadrado3.y = alto / 2
	end

	cuadrado4.width = cuadrado4.width + aumento
	cuadrado4.height = cuadrado4.height + aumento

	cuadrado4.x = cuadrado4.x - velocidad 

	if cuadrado4.x < - 100 then
		cuadrado4.width = 30
		cuadrado4.height = 30

		cuadrado4.x = ancho / 2
	end

end

function cambiaFon(event)
	fondo:setFillColor(math.random(0,1),math.random(0,1),math.random(0,1) )
	return true
end

function revolver(self,event)
	self.x = ancho / 2
	self.y = alto / 2

	self.width = 30
	self.height = 30

	self:setFillColor( 0,1,0 )
end

function cambiarPos(event)
	if event.phase == "began" then
		if event.target == trasDerecha then
			
		elseif event.target == trasIzquierda then
		
		elseif event.target == trasAbajo then	
		
		elseif event.target == trasArriba then	
	
		end
	end
	return true
end

function desaparecer(event)
	if event.phase == "began" then
		if (event.target == cuadrado) then
			revolver(event.target)
		elseif (event.target == cuadrado2) then
			revolver(event.target)
		elseif(event.target == cuadrado3) then
			revolver(event.target)
		elseif (event.target == cuadrado4) then
			revolver(event.target)
		end
	score = score + 1	
	scoreText.text = "Score: "..score
	end
	return true
end

print(ancho.." "..alto)

Runtime:addEventListener( "enterFrame", moverCua )
cuadrado:addEventListener( "touch", desaparecer )
cuadrado2:addEventListener( "touch", desaparecer )
cuadrado3:addEventListener( "touch", desaparecer )
cuadrado4:addEventListener( "touch", desaparecer )
timer.performWithDelay( 300, cambiaFon,0 )
