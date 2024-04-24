module one_hot(i_Start,i_Clk,i_Rstb);
input           i_Clk;        
input           i_Start;        
input           i_Rstb;
reg [2:0]       r_temp;
wire            w_One_Hot_Rising;
wire            w_One_Hot_Falling;

always @ (posedge i_Clk or negedge i_Rstb) begin
    if(i_Rstb==1'b0)
        r_temp <= 3'b0;
    else
        r_temp <= {r_temp[1:0],i_Start};
end

assign w_One_Hot_Rising = r_temp[1] & ~ r_temp[2];
assign w_One_Hot_Falling = ~r_temp[1] & r_temp[2];