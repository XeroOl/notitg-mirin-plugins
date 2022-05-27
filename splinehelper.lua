local function throw(msg)
    local _, err = pcall(error, msg, 4)
    error(err)
end

local function correctAxis(axis)
    local caxis={}
    local validAxis={
                        {'x','X'},
                        {'movex','X'},
                        {'y','Y'},
                        {'movey','Y'},
                        {'z','Z'},
                        {'movez','Z'},
                        {'rotx','RotX'},
                        {'rx','RotX'},
                        {'rotationx','RotX'},
                        {'roty','RotY'},
                        {'ry','RotY'},
                        {'rotationy','RotY'},
                        {'rotz','RotZ'},
                        {'rz','RotZ'},
                        {'rotationz','RotZ'},
                        {'size','Size'},
                        {'tiny','Size'},
                        {'skew','Skew'},
                        {'stealth','Stealth'}
                    }
    for _,i in pairs(axis) do
        local axisfound=false
        for _,v in pairs(validAxis) do
            if string.lower(i)==v[1] then 
                table.insert(caxis,v[2])
                axisfound=true
            end
        end
        if not axisfound then throw('invalid axis: '..i) end
    end
    if caxis~={} then
        return caxis
    end
end

local function setSpline(players,column,pointlist,axis,activation)
    for _,plr in pairs(players) do
        for _,col in pairs(column) do
            for index,point in pairs(pointlist) do
                if index<=40 then
                    if axis=='X' then
                        P[plr]:SetXSpline(index-1,col,point[2],point[1],activation)
                    elseif axis=='Y' then
                        P[plr]:SetYSpline(index-1,col,point[2],point[1],activation)
                    elseif axis=='Z' then
                        P[plr]:SetZSpline(index-1,col,point[2],point[1],activation)
                    elseif axis=='RotX' then
                        P[plr]:SetRotXSpline(index-1,col,point[2],point[1],activation)
                    elseif axis=='RotY' then
                        P[plr]:SetRotYSpline(index-1,col,point[2],point[1],activation)
                    elseif axis=='RotZ' then
                        P[plr]:SetRotZSpline(index-1,col,point[2],point[1],activation)
                    elseif axis=='Size' then
                        P[plr]:SetSizeSpline(index-1,col,point[2],point[1],activation)
                    elseif axis=='Skew' then
                        P[plr]:SetSkewSpline(index-1,col,point[2],point[1],activation)
                    elseif axis=='Stealth' then
                        P[plr]:SetStealthSpline(index-1,col,point[2],point[1],activation)
                    end
                end
            end
        end
    end
end

local function resetSpline(players,column,axis)
    for _,plr in pairs(players) do
        for _,col in pairs(column) do
            if axis=='X' then
                P[plr]:ResetXSplines(col)
            elseif axis=='Y' then
                P[plr]:ResetYSplines(col)
            elseif axis=='Z' then
                P[plr]:ResetZSplines(col)
            elseif axis=='RotX' then
                P[plr]:ResetRotXSplines(col)
            elseif axis=='RotY' then
                P[plr]:ResetRotYSplines(col)
            elseif axis=='RotZ' then
                P[plr]:ResetRotZSplines(col)
            elseif axis=='Size' then
                P[plr]:ResetSizeSplines(col)
            elseif axis=='Skew' then
                P[plr]:ResetSkewSplines(col)
            elseif axis=='Stealth' then
                P[plr]:ResetStealthSplines(col)
            end
        end
    end
end

local function set(t)
    local axis=t[1]
    if type(axis) == 'string' then axis = {axis} end
    axis=correctAxis(axis)
    local pointlist={}
    if type(t[2])=='table' then
        pointlist=t[2]
    else
        local i = 2
        while t[i] do
            if type(t[i]) ~= 'number' then
                throw('invalid offset at index '..i)
            end
            if type(t[i + 1]) ~= 'number' then
                throw('invalid value at index '..(i+1))
            end
            table.insert(pointlist,{t[i],t[i+1]})
            i = i + 2
        end
    end

    local players = t.plr or rawget(xero, 'plr') or {1, 2}
    if type(players) == 'number' then players = {players} end
    
    local column = t.col or -1
    if type(column) == 'number' then column = {column} end

    local activation=t.speed or -1

    local cl,cd,cu,cr,ca=false
    
    for _,v in pairs(column) do
        if v==-1 then ca=true 
        elseif v==0 then cl=true 
        elseif v==1 then cd=true 
        elseif v==2 then cu=true
        elseif v==3 then cr=true
        else
        throw('invalid column: '..v)
        end
    end
    if ca or (cl and cd and cu and cr) then
        column={-1}
    end
    for _,v in pairs(axis) do
        setSpline(players,column,pointlist,v,activation)
    end
    return set
end

local function reset(t)
    if t[1]==nil then t[1]={'all'} end
    local axis=t[1]
    if type(axis) == 'string' then axis = {axis} end
    if axis[1]=='all' then
        axis={'X','Y','Z','RotX','RotY','RotZ','Size','Skew','Stealth'}
    else
        axis=correctAxis(axis)
    end

    local players = t.plr or rawget(xero, 'plr') or {1, 2}
    if type(players) == 'number' then players = {players} end
    
    local column = t.col or {0,1,2,3}
    if type(column) == 'number' then column = {column} end

    local cl,cd,cu,cr,ca=false
    
    for _,v in pairs(column) do
        if v==-1 then ca=true 
        elseif v==0 then cl=true 
        elseif v==1 then cd=true 
        elseif v==2 then cu=true
        elseif v==3 then cr=true
        else
        throw('invalid column: '..v)
        end
    end
    if ca or (cl and cd and cu and cr) then
        column={0,1,2,3}
    end
    for _,v in pairs(axis) do
        resetSpline(players,column,v)
    end
end

return {
    reset = reset,
    set = set
}