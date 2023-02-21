`timescale 1ns/1ps

module synthesizer(
    input clk,
    input [7:0] note,
    output reg [13:0] hz
);

    reg [13:0] tcount [88:0];

    initial begin
        tcount[0] = 0;
        tcount[1] = 6892; //A0
        tcount[2] = 6653;
        tcount[3] = 6429;
        tcount[4] = 5840;
        tcount[5] = 5504;
        tcount[6] = 5204;
        tcount[7] = 4935;
        tcount[8] = 4692;
        tcount[9] = 4370;
        tcount[10] = 4179;
        tcount[11] = 3921;
        tcount[12] = 3693;
        tcount[13] = 3490; //A1
        tcount[14] = 3308;
        tcount[15] = 3093;
        tcount[16] = 2949;
        tcount[17] = 2777;
        tcount[18] = 2623;
        tcount[19] = 2454;
        tcount[20] = 2333;
        tcount[21] = 2198;
        tcount[22] = 2077;
        tcount[23] = 1949;
        tcount[24] = 1836;
        tcount[25] = 1735; //A2
        tcount[26] = 1630;
        tcount[27] = 1550;
        tcount[28] = 1455;
        tcount[29] = 1370;
        tcount[30] = 1295;
        tcount[31] = 1220;
        tcount[32] = 1153;
        tcount[33] = 1086;
        tcount[34] = 1027;
        tcount[35] = 969;
        tcount[36] = 913;
        tcount[37] = 862; //A3
        tcount[38] = 814;
        tcount[39] = 768;
        tcount[40] = 723;
        tcount[41] = 684;
        tcount[42] = 644;
        tcount[43] = 608;
        tcount[44] = 573;
        tcount[45] = 541;
        tcount[46] = 510;
        tcount[47] = 482;
        tcount[48] = 455;
        tcount[49] = 429; //A4
        tcount[50] = 404;
        tcount[51] = 381;
        tcount[52] = 360;
        tcount[53] = 340;
        tcount[54] = 320;
        tcount[55] = 302;
        tcount[56] = 285;
        tcount[57] = 269;
        tcount[58] = 254;
        tcount[59] = 239;
        tcount[60] = 226;
        tcount[61] = 213; //A5
        tcount[62] = 201;
        tcount[63] = 189;
        tcount[64] = 179;
        tcount[65] = 168;
        tcount[66] = 159;
        tcount[67] = 150;
        tcount[68] = 141;
        tcount[69] = 133;
        tcount[70] = 126;
        tcount[71] = 119;
        tcount[72] = 112;
        tcount[73] = 106; //A6
        tcount[74] = 100;
        tcount[75] = 94;
        tcount[76] = 89;
        tcount[77] = 84;
        tcount[78] = 79;
        tcount[79] = 75;
        tcount[80] = 70;
        tcount[81] = 67;
        tcount[82] = 63;
        tcount[83] = 59;
        tcount[84] = 56;
        tcount[85] = 53; //A7
        tcount[86] = 50;
        tcount[87] = 47;
        tcount[88] = 44; //C8
    end

    always @(posedge clk) begin
        hz <= tcount[note];
    end

endmodule
