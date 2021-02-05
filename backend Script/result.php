<?php
session_start();
include 'config/db.php';

                
                
                // API REQUEST
	    		$_SESSION['request'] = $_POST['request'];
                
                
                //Add Student
	        	if ($_SESSION['request'] == "ADD STUDENT") {
	        	    
	        	    $name=$_POST['name'];
	        	    $regno=$_POST['regno'];
	        	    $level=$_POST['level'];
	        	    $semester=$_POST['semester'];
	        	    
	        	    $sql=mysqli_query($connection,"INSERT INTO students (Student_name, regno, level, semester, password) VALUES('$name','$regno', '$level', '$semester','$regno')"); 
			        $result1 = mysqli_query($connection, $sql);
	        	  
	        	}
	        	
	        	
	        	//Add Multiple Students
	        	if ($_SESSION['request'] == "ADD MULTI STUDENT") {
	        	    
	        	    $filename = $_FILES["file"]["tmp_name"];
	        	    $filePath = 'student_uploads/'.$filename;
		            $tmp_name = $_FILES['file']['tmp_name'];
		            move_uploaded_file($tmp_name, $filePath);

                    if ($_FILES["file"]["size"] > 0) {
                        
                        $file = fopen($filename, "r");
                        while (($column=fgetcsv($file, 1000, ',')) !==FALSE) {
            
                          //echo '<pre>'; print_r($column);
            
                          $query2 = mysqli_query($connection, "INSERT INTO students (regno, Student_name, level, semester, password) VALUES('".$column[0]."', '".$column[1]."', '".$column[2]."', '".$column[3]."', '".$column[0]."')");
                          
                        }
                    }

	        	}  
	        	
	        	
	        	
	        	//Fetch students from the Database
	        	if ($_SESSION['request'] == "FETCH ALL STUDENT") {
                    
			        $query6 = "SELECT * FROM students";
			        $result6 = mysqli_query($connection, $query6);
			        $data = array();
			        while ($row = mysqli_fetch_assoc($result6)) {
			        	
			        	$data[] = $row;
			        }
			        
			        header('Content-type: applicatio/json');
			        print(json_encode($data));
	        	}
	        	
	        	
	        	
	        	 //Count Records from the Database
	        	if ($_SESSION['request'] == "COUNT STUDENT") {
	        	    
			        $query7 = "SELECT count(*) FROM students";
			        $result7 = mysqli_query($connection, $query7);
			        $data = array();
			        while ($row = mysqli_fetch_assoc($result7)) {
			        	
			        	$data[] = $row;
			        }
			        
			        header('Content-type: applicatio/json');
			        print(json_encode($data));
	        	}
	        	
	        	
	        	//Delete Student  from the Database
	        	if ($_SESSION['request'] == "DELETE STUDENT") {

	        		$id = $_POST['id'];
			        $query15 = "DELETE FROM students WHERE student_id = '$id'";
			        $result15 = mysqli_query($connection, $query15);
	        	}
	        	
	        	
	            //Upload Result
	        	if ($_SESSION['request'] == "UPLOAD RESULT") {
	        	    
	        	    $filename = $_FILES["file"]["tmp_name"];
	        	    $filePath = 'result_uploads/'.$filename;
		            $tmp_name = $_FILES['file']['tmp_name'];
		            move_uploaded_file($tmp_name, $filePath);

                    if ($_FILES["file"]["size"] > 0) {
                        
                        $file = fopen($filename, "r");
                        while (($column=fgetcsv($file, 1000, ',')) !==FALSE) {
            
                          //echo '<pre>'; print_r($column);
            
                          $query2 = mysqli_query($connection, "INSERT INTO result (regno, student, ccode, ctitle, cunit, level, semester, score, grade, pointt) VALUES('".$column[0]."', '".$column[1]."', '".$column[2]."', '".$column[3]."', '".$column[4]."', '".$column[5]."', '".$column[6]."', '".$column[7]."', '".$column[8]."', '".$column[9]."' )");
                        }
                    }

	        	}  
	        	
	        	

                //Add annoucement
	        	if ($_SESSION['request'] == "ADD ANNOUNCEMENT") {
	        		# code...

				      $title=$_POST['title'];
				      $post=$_POST['post'];

      				  $sql=mysqli_query($connection,"INSERT INTO announcement (title,post) VALUES('$title','$post')"); 
			          $result1 = mysqli_query($connection, $sql);

			    }
			    
			    
			    //Delete ANNOUNCEMENT  from the Database
	        	if ($_SESSION['request'] == "DELETE ANNOUNCEMENT") {

	        		$id = $_POST['id'];
			        $query15 = "DELETE FROM announcement WHERE announcement_id = '$id'
";
			        $result15 = mysqli_query($connection, $query15);
	        	}
	        	
	        		//Fetch Announcement from the Database
	        	if ($_SESSION['request'] == "FETCH ALL ANNOUNCEMENT") {
                    
			        $query6 = "SELECT * FROM announcement";
			        $result6 = mysqli_query($connection, $query6);
			        $data = array();
			        while ($row = mysqli_fetch_assoc($result6)) {
			        	
			        	$data[] = $row;
			        }
			        
			        header('Content-type: applicatio/json');
			        print(json_encode($data));
	        	}
	        	
	        	
	        	//Fetch result from the Database
	        	if ($_SESSION['request'] == "FETCH RESULT") {
                    
                    $regno = $_POST['regno'];
			        $query6 = "SELECT DISTINCT level, regno, semester FROM result WHERE regno='$regno'";
			        $result6 = mysqli_query($connection, $query6);
			        $data = array();
			        while ($row = mysqli_fetch_assoc($result6)) {
			        	
			        	$data[] = $row;
			        }
			        
			        header('Content-type: applicatio/json');
			        print(json_encode($data));
	        	}
	        	
	        	
	        	
	        	 //Admin Login
	        	if ($_SESSION['request'] == "ADMIN LOGIN") {
	        		# code...

		            $username = $_POST['username'];
		            $password = $_POST['password'];

			         $sql= mysqli_query($connection,"SELECT * FROM users WHERE email='$username' AND password='$password'");


                     $result=array();
                
                     while($row=mysqli_fetch_assoc($sql))
                      {
                        
                      $result[]=$row;
                    
                      }
                
                      header('Content-Type: application/json');
                      echo json_encode($result);

			    }



                 //Student Login
	        	if ($_SESSION['request'] == "STUDENT LOGIN") {
	        		# code...

		            $username = $_POST['username'];
		            $password = $_POST['password'];

			         $sql= mysqli_query($connection,"SELECT * FROM students WHERE regno='$username' AND password='$password'");


                     $result=array();
                
                     while($row=mysqli_fetch_assoc($sql))
                      {
                        
                      $result[]=$row;
                    
                      }
                
                      header('Content-Type: application/json');
                      echo json_encode($result);

			    }

			    
			    

  
?>