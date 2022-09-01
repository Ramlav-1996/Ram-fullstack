OTP generation 

prerequisites;




count
DBMS_RANDOM
IF AND END IF
SYSDATE
COUNT

SELECT COUNT(1) FROM otp_details where mobilenumber = 9740860977
and OTP=XXXX;

SELECT SYSDATE ,SYSDATE+1/24 FROM DUAL; ADDING ONE HR

SELECT SYSDATE ,SYSDATE+1/24*60 FROM DUAL; ADDING ONE MIN 

select dbms_random.value(1,100) from dual;

select trunc(dbms_random.value(1,100)) from dual;

ONE TIME PASSWORD ; 6 DIGIT

RANDOM VALUE GENERATION 

SELECT TRUNC(DBMS_RANDOM.VALUE(100000, 999999))
FROM DUAL;

IF AND END IF

OTP_DETAILS

Mobile number  OTP  OTPGENERATEDTIME  OTPEXPIRED TIME
9740960977     123456 SYSDATE          SYSDATE+1/(24*60)

CREATE OR REPLACE PROCEDURE OTP_GENERATION (P_phone in number,p_otp out number)
as
begin 
	SELECT TRUNC(DBMS_RANDOM.VALUE(100000, 999999)) INTO p_out from dual;
	Insert into otp_details( mobilenumber, otp, otpgeneratedtime,otpexpiredtime)
	values(P_phone, p_otp, sysdate, sysdate+1/(24*60));
commint

execute procudeure 

using anonymous vblock

declare 
OTP NUMBER;
BEGIN 
	otp_generation('9740860977' ,OTP);
	DBMS_OUTPUT.PUT_LINE(OTP);
END;
OUTPUT 1112222

CREATE TABLE OTP_DETAILS
(PHONE_NUMBER   NUMBER,
  OTP           NUMBER,
  OTP_GENERATION_TIME TIMESTAMP,
  OTP_EXPIRE_TIME TIMESTAMP
)

CREATE OR REPLACE PROCEDURE PROC_OTP_GENERATION 
(P_PHONE IN NUMBER, P_OTP OUT NUMBER)
AS
BEGIN
    select trunc(dbms_random.value(100000,999999)) into p_otp from dual;
    insert into OTP_DETAILS(PHONE_NUMBER , OTP , OTP_GENERATION_TIME, OTP_EXPIRE_TIME)
    VALUES(P_PHONE,P_OTP, SYSDATE, SYSDATE+1/(24*60));
END;

DECLARE 
OTP  NUMBER ;
Begin 
    PROC_OTP_GENERATION('9740860977' , OTP);
END; 

--OTP Validation 

create or replace procedure OTP_validation ( P_phone in number, p_otp  in number, p_Message out varchar2)
AS
L_count number;
begin 

select count(10) into l_count from OTP_DETAILS where PHONE_NUMBER =P_phone and otp = P_OTP and SYSDATE BETWEEN 
OTP_GENERATION_TIME AND OTP_EXPIRE_TIME;
if l_count=1 then 
P_Message := 'OTP applied successffuly';
ELSE
p_message := 'OTP IS EXPIRED/INVALID';
END IF;

DECLARE
Message varchar2(200);
Begin  
OTP_validation( 9740860977, 501689 , Message);
dbms_output.put_line(Message);
end;

