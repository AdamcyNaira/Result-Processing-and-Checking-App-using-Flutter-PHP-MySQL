<?php 

session_start();
$connection=mysqli_connect("localhost", "root", "", "teamcode_db_result");

//FPDF PLUGIN
require "fpdf.php";

$_SESSION['reg'] = $_GET['regno'];
$_SESSION['semester'] = $_GET['semester'];
	

class myPDF extends FPDF{

	function header1($connection){
	     $sql2=mysqli_query($connection,"SELECT * FROM result
		WHERE result.regno='".$_SESSION['reg']."'
		");
		while ($row = mysqli_fetch_array($sql2)) {
		$name=$row["student"];
		$regno=$row["regno"];
		$level=$row["level"];
		$semester=$row["semester"];
		}
		
		$this->Image('assets/img/logo1.png', 12, 10);
		$this->SetFont('Arial', 'B', 14);
		$this->Cell(190,7, 'DEPARTMENT OF COMPUTER SCIENCE',0,0,'C');
		$this->Ln();
		$this->SetFont('Arial', 'B', 14);
		$this->Cell(190,8, 'KADUNA POLYTECHNIC, KADUNA',0,0,'C');
		$this->Image('assets/img/barcode.png', 170, 10);
		$this->Ln();
		$this->SetFont('times', 'B', 14);
		$this->Cell(190,6, 'STUDENTS STATEMENT OF RESULT',0,0,'C');
		$this->Ln();
		$this->SetFont('times', 'I', 12);
		$this->Cell(190,15, 'This is not a transcript',0,0,'C');
		$this->Ln();
		$this->SetFont('times', '', 14);
		$this->Cell(14,6, 'Name: ',0,0,'C');
		$this->Cell(100,6,  $name,0,0,'L');
		$this->Cell(10,6, ' ',0,0,'C');
		$this->Cell(20,6, 'Reg. No.: ',0,0,'C');
		$this->Cell(60,6, $regno,0,0,'L');
		$this->Ln();
		$this->Cell(25,10, 'Programme: ',0,0,'C');
		$this->Cell(100,10, ' HND Computer Science  ',0,0,'L');
		$this->Cell(1,6, ' ',0,0,'C');
		$this->Cell(13,10, 'Session: ',0,0,'C');
		$this->Cell(25,10, ' 2019',0,0,'L');
		$this->Cell(10,10, 'Level: ',0,0,'C');
		$this->Cell(60,10,  $level,0,0,'L');
		$this->Ln();
		$this->Cell(191,10, 'FIRST SEMESTER' ,1,0,'C');
		$this->Ln();
	}
	
	function footer(){
		$this->SetY(-15);
		$this->SetFont('Arial', '', 8);
		$this->Cell(0,10, 'Page '.$this->PageNo().'/{nb}',0,0,'C');
	}


	function viewTable($connection){
	     $sql3=mysqli_query($connection,"SELECT sum(cunit) FROM result
		WHERE result.regno='".$_SESSION['reg']."' AND result.semester='".$_SESSION['semester']."'
		");
		while ($row = mysqli_fetch_array($sql3)) {
		$cunit=$row["sum(cunit)"];
		}
		
		$sql4=mysqli_query($connection,"SELECT sum(pointt) FROM result
		WHERE result.regno='".$_SESSION['reg']."' AND result.semester='".$_SESSION['semester']."'
		");
		while ($row = mysqli_fetch_array($sql4)) {
		$pointt=$row["sum(pointt)"];
		}
		
		$totalPoint = $pointt / $cunit;
		
		if ($totalPoint >= 3.5){
		    
		    $remark = "DISTINCTION";
		} elseif ($totalPoint >= 3.00){
		    
		    $remark = "UPPER CREDIT";
		} elseif ($totalPoint >= 2.5){
		    
		    $remark = "LOWER CREDIT";
		} elseif ($totalPoint >= 2.00){
		    
		    $remark = "PASS";
		} else{
		    
		    $remark = "FAIL";
		}
		
		$this->SetFont('times', '', 12);
		$count=1;
		 $sql2=mysqli_query($connection,"SELECT * FROM result
	      WHERE result.regno='".$_SESSION['reg']."' AND result.semester='".$_SESSION['semester']."'
	      ");
	      while ($row = mysqli_fetch_array($sql2)) {
	    $this->Cell(10, 10, $count++, 1, 0, 'C');
		$this->Cell(33, 10, $row["ccode"], 1, 0, 'L');
		$this->Cell(90, 10, $row["ctitle"], 1, 0, 'L');
		$this->Cell(15, 10, $row["cunit"], 1, 0, 'L');
		$this->Cell(18, 10, $row["grade"], 1, 0, 'L');
		$this->Cell(25, 10, $row["pointt"], 1, 0, 'L');
		$this->Ln();


	      }
	    $this->setFillColor(230,230,230); 
		$this->Cell(43,10, '' ,1,0,'C', 'TRUE');
		$this->setFillColor(230,230,230); 
		$this->Cell(35,10, 'Total Credit Unit' ,1,0,'C', 'TRUE');
		$this->setFillColor(230,230,230); 
		$this->Cell(35,10, 'Total Points' ,1,0,'C', 'TRUE');
		$this->setFillColor(230,230,230); 
		$this->Cell(20,10, 'GPA' ,1,0,'C', 'TRUE');
		$this->setFillColor(230,230,230); 
		$this->Cell(58,10, 'Remark/Outstanding Courses' ,1,0,'C', 'TRUE');
		$this->Ln();
		$this->Cell(43,20, 'Current' ,1,0,'C');
		$this->Cell(35,20, $cunit ,1,0,'C');
		$this->Cell(35,20, $pointt ,1,0,'C');
		$this->Cell(20,20, $totalPoint ,1,0,'C');
		$this->Cell(58,20, $remark ,1,0,'C');
		$this->Ln();
	}

	function headerTable(){
		$this->SetFont('times', 'B', 12);
		$this->Cell(10, 10, 'S/N', 1, 0, 'C');
		$this->Cell(33, 10, 'COURSE CODE', 1, 0, 'C');
		$this->Cell(90, 10, 'COURSE TITLE', 1, 0, 'C');
		$this->Cell(15, 10, 'UNIT', 1, 0, 'C');
		$this->Cell(18, 10, 'GRADE', 1, 0, 'C');
		$this->Cell(25, 10, ' POINT', 1, 0, 'C');
		$this->Ln();
	}

}

$pdf = new myPDF();
$pdf->AliasNbPages();
$pdf->AddPage('P', 'A4', 0);
$pdf->header1($connection);
$pdf->headerTable();
$pdf->viewTable($connection);
$pdf->Output();

 ?>