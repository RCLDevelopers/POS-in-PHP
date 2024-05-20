<?php include 'db_connect.php' ?>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {

        var data = google.visualization.arrayToDataTable([
          ['Category', 'Sold Per Day'],
          ['Chinese',     11],
          ['Mexican',      2],
          ['Pizza',  2],
          ['Japanese', 2],
          ['Thai',    7]
        ]);

        var options = {
          title: 'Recent Sale'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
      }
    </script>
<style>
   span.float-right.summary_icon {
    font-size: 3rem;
    position: absolute;
    right: 1rem;
    top: 0;
}
.imgs{
		margin: .5em;
		max-width: calc(100%);
		max-height: calc(100%);
	}
	.imgs img{
		max-width: calc(100%);
		max-height: calc(100%);
		cursor: pointer;
	}
	#imagesCarousel,#imagesCarousel .carousel-inner,#imagesCarousel .carousel-item{
		height: 60vh !important;background: black;
	}
	#imagesCarousel .carousel-item.active{
		display: flex !important;
	}
	#imagesCarousel .carousel-item-next{
		display: flex !important;
	}
	#imagesCarousel .carousel-item img{
		margin: auto;
	}
	#imagesCarousel img{
		width: auto!important;
		height: auto!important;
		max-height: calc(100%)!important;
		max-width: calc(100%)!important;
	}
</style>

<div class="containe-fluid">
	<div class="row mt-3 ml-3 mr-3 dashcard">
        <!-- <div class="col-lg-12">
            <div class="card">
                <div class="card-body">
                    <?php echo "Welcome back". $_SESSION['login_name']."!"  ?>
                    <hr>
                </div>
            </div>      			
        </div> -->
        <div class="col-md-6">
        <div class="row">
        <div class="col-md-6 mb-3">
            <div class="card bg-white border-0 circle-primary theme-circle">
                <div class="card-body">
                    <h4 class="text-dark ">Category</h4>
                    <div class="mt-3">
                        <div class="d-flex align-items-center">
                            <span class="text-dark mr-3">
                                <h3 class="">30</h3>
                            </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-6 mb-3">
            <div class="card bg-white border-0 circle-secondary theme-circle">
                <div class="card-body">
                    <h4 class="text-dark ">Orders</h4>
                    <div class="mt-3">
                        <div class="d-flex align-items-center">
                            <span class="text-dark mr-3">
                                <h3 class="">20</h3>
                            </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-6 mb-3">
            <div class="card bg-white border-0 circle-success theme-circle">
                <div class="card-body">
                    <h4 class="text-dark ">Product</h4>
                    <div class="mt-3">
                        <div class="d-flex align-items-center">
                            <span class="text-dark mr-3">
                                <h3 class="">120</h3>
                            </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-6 mb-3">
            <div class="card bg-white border-0 circle-info theme-circle">
                <div class="card-body">
                    <h4 class="text-dark ">User</h4>
                    <div class="mt-3">
                        <div class="d-flex align-items-center">
                            <span class="text-dark mr-3">
                                <h3 class="">4</h3>
                            </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
        <div class="col-md-6 mb-3">
            <div class="card border-0">
                <div class="card-body">
                     <div id="piechart" style="width: 100%;height:350px;"></div>
                </div>
            </div>
        </div>
        <p style="color: blue; font-size: 14px;"> :   For any <b>Academic Project Development or Commercial Project/Website Development. </b>Contact Mayuri K. : mayuri.infospace@gmail.com</p>
            <!-- Table Panel -->
            <div class="col-md-12 mb-5">
                <div class="card">
                    <div class="card-header">
                        <b>List of Orders </b>
                    </div>
                    <div class="card-body">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Date</th>
                                    <th>Invoice</th>
                                    <th>Order Number</th>
                                    <th>Amount</th>
                                    <th>Status</th>
                                    
                                </tr>
                            </thead>
                            <tbody>
                                <?php 
                                $i = 1;
                                $order = $conn->query("SELECT * FROM orders order by unix_timestamp(date_created) desc ");
                                while($row=$order->fetch_assoc()):
                                ?>
                                <tr>
                                    <td class="text-center"><?php echo $i++ ?></td>
                                    <td>
                                        <p> <?php echo date("M d,Y",strtotime($row['date_created'])) ?></p>
                                    </td>
                                    <td>
                                        <p> <?php echo $row['amount_tendered'] > 0 ? $row['ref_no'] : 'N/A' ?></p>
                                    </td>
                                    <td>
                                        <p><?php echo $row['order_number'] ?></p>
                                    </td>
                                    <td>
                                        <p class="text-right"> <?php echo number_format($row['total_amount'],2) ?></p>
                                    </td>
                                    <td class="text-center">
                                        <?php if($row['amount_tendered'] > 0): ?>
                                            <span class="badge badge-success">Paid</span>
                                        <?php else: ?>
                                            <span class="badge badge-primary">Unpaid</span>
                                        <?php endif; ?>
                                    </td>
                                   
                                </tr>
                                <?php endwhile; ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!-- Table Panel -->
    </div>
</div>

 
<script>
	$('#manage-records').submit(function(e){
        e.preventDefault()
        start_load()
        $.ajax({
            url:'ajax.php?action=save_track',
            data: new FormData($(this)[0]),
            cache: false,
            contentType: false,
            processData: false,
            method: 'POST',
            type: 'POST',
            success:function(resp){
                resp=JSON.parse(resp)
                if(resp.status==1){
                    alert_toast("Data successfully saved",'success')
                    setTimeout(function(){
                        location.reload()
                    },800)

                }
                
            }
        })
    })
    $('#tracking_id').on('keypress',function(e){
        if(e.which == 13){
            get_person()
        }
    })
    $('#check').on('click',function(e){
            get_person()
    })
    function get_person(){
            start_load()
        $.ajax({
                url:'ajax.php?action=get_pdetails',
                method:"POST",
                data:{tracking_id : $('#tracking_id').val()},
                success:function(resp){
                    if(resp){
                        resp = JSON.parse(resp)
                        if(resp.status == 1){
                            $('#name').html(resp.name)
                            $('#address').html(resp.address)
                            $('[name="person_id"]').val(resp.id)
                            $('#details').show()
                            end_load()

                        }else if(resp.status == 2){
                            alert_toast("Unknow tracking id.",'danger');
                            end_load();
                        }
                    }
                }
            })
    }
</script>