using HorizonSideRobots
robot = Robot(animate = true)

function inverse(side)
    return HorizonSide(((Int(side))+2)%4)
end


function untildawn(robot , side)
    n = 0 
    while !isborder(robot, side)
        move!(robot, side)
        n+=1
    end
    return n
end

function symmetricallymove!(robot, side)
    isborder(robot, inverse(side)) && (untildawn(robot, side); return)
    move!(robot, inverse(side))
    symmetricallymove!(robot, side)
    move!(robot, inverse(side))
end 


'n - расстояние до 1 перегородки
нужно,чтобы робот прошел расстояние n от второй перегородки
