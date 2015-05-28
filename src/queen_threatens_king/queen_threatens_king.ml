let queen_threatens_king (qx: int) (qy: int) (kx: int) (ky: int) : bool =
  qx = kx || (* same row *)
  qy = ky || (* same column *)
  abs (qx - kx) = abs (qy - ky) (* same diagonal *)
