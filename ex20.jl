using HorizonSideRobots

r = Robot(animate = true)

function inverse(side)
    return HorizonSide(((Int(side))+2)%4)
end 

function go(r,side)
    if isborder(r,side)
        putmarker!(r)
    else
        move!(r,side)
        go(r,side)
        move!(r, inverse(side))
    end 
end 
