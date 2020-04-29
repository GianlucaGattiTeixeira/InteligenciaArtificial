
horoscopo(acuario,21,1,21,2).
horoscopo(piscis,21,2,21,3).
horoscopo(aries,21,3,21,4).
horoscopo(tauro,21,4,21,5).
horoscopo(geminis,21,5,21,6).
horoscopo(cancer,21,6,21,7).
horoscopo(leo,21,7,21,8).
horoscopo(virgo,21,8,21,9).
horoscopo(libra,21,9,21,10).
horoscopo(escorpio,21,10,21,11).
horoscopo(sagitario,21,11,21,12).
horoscopo(capricornio,21,12,21,1).

mes(1,31).
mes(2,29).
mes(3,31).
mes(4,30).
mes(5,31).
mes(6,30).
mes(7,31).
mes(8,31).
mes(9,30).
mes(10,31).
mes(11,30).
mes(12,31).

signocorrecto(S,DD,MM):-
    horoscopo(S,DC,MC,DF,MF),((DD>=DC,MM=MC,mes(MM,X),DD=<X);(DD=<DF,MM=MF)).

misigno(DD,MM):-
    horoscopo(S,DC,MC,DF,MF),((DD>=DC,MM=MC,mes(MM,X),DD=<X);(DD=<DF,MM=MF)),write(S).