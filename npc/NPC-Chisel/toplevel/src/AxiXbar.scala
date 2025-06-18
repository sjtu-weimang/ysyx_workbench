import chisel3._
import chisel3.util._

object RangeLookup {

  /** @param key a key to search for
   * @param default a default value if nothing is found
   * @param mapping a sequence to search of keys and values
   * @return the value found or the default if not
   */
  def apply[S <: UInt, T <: Data](key: S, default: T, mapping: Seq[(S, S, T)]): T = {
    /* If the mapping is defined for all possible values of the key, then don't use the default value */
    val (defaultx, mappingx) = key.widthOption match {
      case Some(width) =>
        val keySetSize = BigInt(1) << width
        val keyMask = keySetSize - 1
        val distinctLitKeys = mapping.flatMap(_._1.litOption).map(_ & keyMask).distinct
        if (distinctLitKeys.size == keySetSize) {
          (mapping.head._3, mapping.tail)
        } else {
          (default, mapping)
        }
      case None => (default, mapping)
    }

    mappingx.foldLeft(defaultx) { case (d, (ks, ke, v)) => Mux(key >= ks && key <=ke, v, d) }
  }
}

class Axibar(val OutNum:Int,val AddressMap:Array[(Long.Long)])extends Module{
    val io = IO(new Bundle{
        val in=new Axi4IO()
        val out=Vec(outNum,Flipped(new Axi4IO()))
    })

    val State_Bit_width=(log2Ceil(OutNum)+1).W

    //state_r 值为i表示当前正在处理第i个输出接口，值为outNum表示空闲状态
    val state_r = RegInit(OutNum.U(State_Bit_Width))
    val state_r_idle=OutNum.U 
    state_r :=MuxLookup(state_r,OutNum.U,
        (0 until OutNum).map(i=>{
            i.U(state_Bit_Width)->Mux(io.in.rready && io.out.rvalid,state_r_idle,
            i.U(State_Bit_Width))
        }):+(state_r_idle->Mux(io.in.arvalid,RangeLookup(io.in.araddr,state_r_idle,
            AddressMap.map(
            {case(start,end)=>(
                start.U(Constant.BitWidth),end.U(Constant.BitWidth),AddressMap.indexOf((
                    start,end)).U
            )}).toIndexedSeq

            ),state_r_idle)))
    
    for(i<- 0 until OutNum){
      io.out(i).araddr:=io.in.araddr
      io.out(i).arvalid:=state_r===i.U(State_Bit_Width)&& io.in.arvalid
      io.out(i).arburst:=io.in.arsize 
      io.out(i).arlen:=io.in.arlen 
      io.out(i).arid:=io.in.arid 
      io.out(i).rready:=state_r === i.U(State_Bit_Width) && io.in.rready
    }
    
    io.in.arready := Mux(state_r === state_r_idle, false.B, io.out(state_r).arready)
    io.in.rdata := Mux(state_r === state_r_idle, 0.U, io.out(state_r).rdata)
    io.in.rresp := Mux(state_r === state_r_idle, 0.U, io.out(state_r).rresp)
    io.in.rvalid := Mux(state_r === state_r_idle, false.B, io.out(state_r).rvalid)
    io.in.rlast := Mux(state_r === state_r_idle, false.B, io.out(state_r).rlast)
    io.in.rid := Mux(state_r === state_r_idle, 0.U, io.out(state_r).rid)

    val state_w=RegInit(OutNum.U(State_Bit_Width))
    val state_w_idle=OutNum.U 
    state_w := MuxLookup(state_w, OutNum.U,
    (0 until OutNum).map( i => {
        i.U(State_Bit_Width) -> Mux(io.in.bready && io.out(i).bvalid, state_w_idle, i.U(State_Bit_Width))
      }) :+ (state_w_idle -> Mux(io.in.awvalid, RangeLookup(io.in.awaddr, state_w_idle,
      AddressMap.map(
        {case (start, end) =>
          (start.U(Constant.BitWidth), end.U(Constant.BitWidth), AddressMap.indexOf((start, end)).U)
        }).toIndexedSeq
    ), state_w_idle)))

    for(i<- 0 until OutNum){
      io.out(i).awaddr:=io.in.awaddr
      io.out(i).awvalid:=state_w === i.U(State_Bit_width) && io.inawvalid
      io.out(i).awsize:=io.in.awsize
      io.out(i).awlen:=io.in.awlen
      io.out(i).awburst=io.in.awburst
      io.out(i).awid := io.in.awid
      io.out(i).wdata := io.in.wdata
      io.out(i).wstrb := io.in.wstrb
      io.out(i).wvalid := state_w === i.U(State_Bit_Width) && io.in.wvalid
      io.out(i).wlast := state_w === i.U(State_Bit_Width) && io.in.wlast
      io.out(i).bready := state_w === i.U(State_Bit_Width) && io.in.bready
    }
    io.in.awready := Mux(state_w === state_w_idle, false.B, io.out(state_w).awready)
    io.in.wready := Mux(state_w === state_w_idle, false.B, io.out(state_w).wready)

    io.in.bresp := Mux(state_w === state_w_idle, 0.U, io.out(state_w).bresp)
    io.in.bvalid := Mux(state_w === state_w_idle, false.B, io.out(state_w).bvalid)
    io.in.bid := Mux(state_w === state_w_idle, 0.U, io.out(state_w).bid)

}