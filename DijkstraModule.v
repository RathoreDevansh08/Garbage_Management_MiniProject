module main;
reg [2:0] i,j,k,row,col,target,temp ;
reg [4:0] cap;
reg [7:0] INF = 8'b11111111; 
//3 dustbins
reg [7:0] adjMat [0:2][0:2];
reg [5:0] path [0:2][0:6];
reg visited [0:2][0:6];
reg picked [0:2][0:6];
reg [7:0] dist [0:2][0:6];
reg [2:0] dustbin [0:2];
  initial 
    begin
    for (i=0; i<3; i++)
      for (j=0; j<3; j++)
            adjMat[i][j] = 0;
        //dustbin load initialisation
        dustbin[0] = 0;
        dustbin[1] = 1;
        dustbin[2] = 2;
        //creating edges
        adjMat[0][1] = 3;
        adjMat[1][2] = 6;
        adjMat[2][0] = 5;
        adjMat[1][0] = 3;
        adjMat[2][1] = 6;
        adjMat[0][2] = 5;
    for (i=0; i<3; i++)
      for (j=0; j<7; j++)
            begin
            visited[i][j] = 0;
            picked[i][j] = 0;
            end
    for (i=0; i<3; i++)
        for (j=0; j<7; j++)
            dist[i][j] = INF;
        $display("Bye, World");
       // $finish ;
    end
    //priority queue
    function [6:0] minimum;
    input in; 
    reg [2:0] i,j;
    reg [7:0] min;
    reg [6:0] index;
    begin
        min = 8'b11111111;
        index = 7'b1000000;
        for(i=0;i<3;++i)
            for(j=0;j<7;++j)
            begin
                if(visited[i][j] == 0 && min > dist[i][j])
                begin
                min = dist[i][j];
                index[2:0] = j[2:0];
                index[5:3] = i[2:0];
                index[6] = 0;
                end
            end
            //index[2:0] = 3'b001;
            //index[5:3] = 3'b100;
            minimum = index;
    end
endfunction
    //Dijkstra
    //centre
    //visited[0][2] = 1;
    reg [6:0] min;
    initial begin
    dist[0][2] = 0;
    min = minimum(3);
    target = 2;
    while(min != 7'b1000000)
    begin
        i = min[5:3];
        j = min[2:0];
        visited[i][j] = 1;
        dustbin[i]= 0;
        for(k=0;k<3;++k)
        begin
            if(adjMat[i][k] != 0)
            begin
                cap = j + dustbin[k];
                //$display("%d %d %d",i,j,cap);
                if(k == target)
                begin
                    if(visited[k][j]==0 &&dist[i][j]+adjMat[i][k] < dist[k][j])
                        begin
                        dist[k][j] = dist[i][j]  + adjMat[i][k];
                        path[k][j][2:0] = j;
                        path[k][j][5:3] = i;
                        picked[k][j] = 1;
                        end
                end
                else
                begin
                    if(visited[k][cap]==0 &&cap < 5 && dist[i][j]+adjMat[i][k] < dist[k][cap])//6 is max truck capacity
                        begin
                        dist[k][cap] = dist[i][j]  + adjMat[i][k];
                        path[k][cap][2:0] = j;
                        path[k][cap][5:3] = i;
                        picked[k][cap] = 1;
                        end
                    if(visited[k][j]==0 &&dist[i][j]+adjMat[i][k] < dist[k][j])
                        begin
                        dist[k][j] = dist[i][j]  + adjMat[i][k];
                        path[k][j][2:0] = j;
                        path[k][j][5:3] = i;
                        picked[k][j] = 0;
                        end
                end
            end
        end
        min = minimum(3);
        
    end
    end
    initial begin
        for(k=0;k<7;++k)
         if(dist[target][k] != INF)
         j = k;
         while(target != 0)
         begin
            if(picked[target][j] != 0)
            begin
                $display("%d(picked)",target);
            end
            else
            begin
                $display("%d(not picked)",target);
            end
            temp = target;
            target = path[target][j][5:3];
            j = path[temp][j][2:0];
         end
         $display("%d",target);
     end
endmodule
