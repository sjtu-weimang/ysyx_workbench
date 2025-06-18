import chisel3._
import chisel3.util._
//产生4位随机数
class LFSR extends Module{
    val io=IO(new Bundle{
        val out=Output(UInt(4.W))
    })

    val lfsr = RegInit(1.U(4.W))
    val feedback = lfsr(3)^lfsr(2) 

    
    lfsr := Cat(lfsr(2, 0), feedback)
    

    io.out := lfsr
}