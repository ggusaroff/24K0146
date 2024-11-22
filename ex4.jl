using HorizonSideRobots
r = Robot(animate=true, 9, 9)

using HorizonSideRobots

function xcross!(robot)
    for s in ((Nord, Ost), (Sud, Ost), (Sud, West), (Nord, West))
        n = xmark_direct!(robot, s)
        xmove!(robot, inverse.(s), n)
    end
end

function xmark_direct!(robot, side::NTuple{2, HorizonSide})
        n=0
        while !(isborder(robot, side[1]) || isborder(robot, side[2]))
    # перегородки нет с обох направлений
            move!(robot, side[1])
            move!(robot, side[2])
            putmarker!(robot)
            n+=1
        end
        return n
end
function inverse(side)
    return HorizonSide(((Int(side))+2)%4)
end 
    
function xmove!(robot, side::NTuple{2, HorizonSide}, num_steps::Integer)
    for _ in 1:num_steps
        move!(robot, side[1])
        move!(robot, side[2])
    end
end
