USE [UPAudit]
GO
/****** Object:  StoredProcedure [dbo].[SP_Designation]    Script Date: 05-Feb-20 7:34:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SP_Designation]
(
@ID	int output,
@SHName	varchar(6)	= null,
@HName	nvarchar(64)= null,
@Name	varchar(64)= null,
@ParentID	int	= null,
@DesignationID numeric(10, 0) = null,
@ParentDesignationID nvarchar(100) = null,
@TreeLevel int = null,
@Sptype int,
@msg varchar(max) output
		
)		


As
declare @str varchar(max)
declare @count int
--declare @TreeLevel int
 begin transaction    
begin try 
 ---------------------DISPLAY-----------
if(@SpType=0)--Display
	BEGIN
	
		set @str=	'SELECT Name,
		(CASE WHEN MDesignation.SHName=''HO'' THEN ''Head Officer'' 
		WHEN MDesignation.SHName=''RO'' THEN ''Divisional Officer'' 
		WHEN MDesignation.SHName=''DO'' THEN ''District Officer'' 
		ELSE ''Auditor'' END )SHName1,
		SHName,
		ID,HName,
		isnull(TreeLevel,0) as TreeLevel,
		isnull(MDesignation.ParentID,null)ParentID,
		(select Name from MDesignation mm where mm.ID=MDesignation.ParentID  )PName         
		 from MDesignation where 1=1'		  		  
                    
                      if(@ParentID!=0)
                      begin 
                       set @str=@str + 'and MDesignation.ParentID=' + convert(varchar,@ParentID) +''
                      end
                     
                     exec (@str)	
	END
	-------------------------------------INSERT----------------------------------------
if(@SpType=1)  
begin 
if(@ParentID is null)
              begin
	            select @count=count(*) from MDesignation where (Name=@Name and SHName=@SHName
	              and ParentID is null )
	           end
	           else
	           begin 
	           select @count=count(*) from MDesignation where (Name=@Name and SHName=@SHName
	             and ParentID=@ParentID)
	           end
	
	if(@count=0)
	BEGIN 
		
	--set @SHName=dbo.get_Max_SHName();
	
	
	
	insert into MDesignation
	(
SHName,	
Name,	
HName,	

ParentID,	
TreeLevel
	)
	values
	(
	   	
	
@SHName	,
@Name,
@HName,	
@ParentID,
@TreeLevel
	)

	Declare @ParentableID int = 0
	SET @ParentableID = (Select max(ID) from MDesignation)

	Declare @uery1 nvarchar(max)
set @uery1='insert into M_Designation_Detail
	(DesignationID,ParentDesignationID)
	select '+convert(varchar, @ParentableID)+',ID from MDesignation
	where ID in('+@ParentDesignationID+')'
	if(@ParentDesignationID!='')
	begin exec (@uery1) end
		--values(@ParentableID,@ParentDesignationID)
	set @msg='Record Saved successfully...!'
	END
	else
	begin 
	set @msg='Record Already Exists...!'
	end
	end
	-------------------------------DELETE---------
if(@Sptype=2) 
begin 
select @count= count(*) from MDesignation where ParentID=@ID
if(@count=0)
begin
Declare @Parent_Id int = 0;
Declare @Child_Id int = 0;
Set @Parent_Id = (Select ID from MDesignation where ID = @ID)

delete from MDesignation where ID=@ID
Delete from M_Designation_Detail where DesignationID = @Parent_Id
set @msg='Record Deleted successfully...!'
end
else
set @msg='Record Cannot Be Deleted ..!'
end
---------------------------------------------UPDATE------------
if(@Sptype=3)
begin 
select @count=count(*) from MDesignation where (Name=@Name 
and SHName=@SHName and ID!=@ID)
 if(@count=0)
 begin 
update MDesignation set SHName=@SHName, Name=@Name,HName=@HName,
ParentID=@ParentID,TreeLevel=@TreeLevel where ID=@ID

--ChidTbl Update----
Delete M_Designation_Detail where DesignationID=@ID
Declare @uery nvarchar(max)
set @uery='insert into M_Designation_Detail
	(DesignationID,ParentDesignationID)
	select '+convert(varchar, @ID)+',ID from MDesignation
	where ID in('+@ParentDesignationID+')'
	exec (@uery)
--update M_Designation_Detail  set ParentDesignationID=@ParentDesignationID,DesignationID = @DesignationID where DesignationID =@DesignationID'

set @msg='Record Updated successfully...!'
 end
 else
 set @msg='Record Already Exists...!'
end
else if(@Sptype=4)
begin 
if(@Name!='')

begin
select ParentDesignationID from M_Designation_Detail where DesignationID=( select ID from MDesignation where Name=@Name)
end
else
begin 
select dbo.UDF_GetName(Name,HName)as Name,ID from MDesignation where Name
 not in(select Name from MDesignation where Name=@Name) 
end
end

--select * from MDesignation
--select * from M_Designation_Detail where 
commit transaction    
end try    
BEGIN CATCH      
  ROLLBACK TRANSACTION      
   select @msg=dbo.UDF_GetErrorMsg(ERROR_NUMBER());    
     
 END CATCH