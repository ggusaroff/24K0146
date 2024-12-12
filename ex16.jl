using HorizonSideRobots

r = Robot(animate=true)

function HorizonSideRobots.move!(r,side,n)
    for i in 1:n
        move!(r,side)
    end 
end

function shuttle!(stop_condition::Function, r, side)
    side1 = Ost
    side2 = West
    a = 0
    b = 1
    while stop_condition(r, side) == 1 
        if a % 2 == 0
            move!(r,side1,b)
        end
        if a % 2 == 1
            move!(r,side2,b)
        end
        b += 1
        a += 1
    end
    move!(r, side)
end


#side1 и side2 определяют направления (Ost и West).
#Переменные a и b используются для контроля количества шагов и определения текущей стороны.
#В цикле while проверяется условие остановки:Если a четное, робот перемещается в сторону side1 (Ost).Если a нечетное, робот перемещается в сторону side2 (West).
#Переменная b увеличивается на 1 после каждого цикла, что означает, что робот будет двигаться на все большее количество шагов с каждым проходом.
#После выхода из цикла робот перемещается в заданную сторону side'
# stop_condition - isborder, side -  Nord (  shuttle!(isborder,r,Nord)  )