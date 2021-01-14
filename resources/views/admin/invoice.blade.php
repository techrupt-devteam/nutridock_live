@extends('admin.layouts.master')
@section('content')


<div id="inventory-invoice" class="mx-auto" style="max-width:1024px">

    <div class="toolbar hidden-print">
        <div class="text-right">
            <!-- <button type="button" onclick='printDiv();' id='btn' value='Print' class="btn btn-info"><i class="fa fa-print"></i> Print</button> -->
            <button onclick='printDiv();' class="btn btn-success"><i class="fa fa-print"></i> Print</button>
            <button id="btnExport" class="btn btn-info"><i class="fa fa-file-pdf-o"></i> Export as PDF</button>
            <a href="{{url('')}}/admin/view-subscribe-now" class="btn btn-info"><i class="fas fa-long-arrow-alt-right"></i></a>

            <!-- <button class="btn btn-info"><i class="fa fa-file-pdf-o"></i> <i class="fas fa-long-arrow-alt-right"></i></button> -->
        </div>
        <hr>
    </div>
    <div class="invoice" id='DivIdToPrint'>
        <div style="width: 100%">
            <header>
                <div class="row">
                    <div class="col">
                        <a target="_blank" href="#">
                            <!-- <h1>COMPANY LOGO</h1> -->
                            <img src="{{url('')}}/public/front/img/logo.png" alt=""> 
                            </a>
                    </div>
                    <div class="col company-details company_details ">
                        <h2 class="name">
                            <a target="_blank" href="javascript:;" style="color: #51d26c;text-decoration: none;font-size:24px">Nutridock</a>
                        </h2>
                        <div style="font-size: 1rem;">Nutridock, Store B-17,MIDC Ambad</div>
                        <div style="font-size: 1rem;">Nashik,Maharashtra 422010</div>
                        <div style="font-size: 1rem;">GST EU826113958</div>
                    </div>
                </div>
            </header>
            <?php foreach($arr_data as $row); 
            foreach($subscribe_now_data_arr as $subscribe_now_data_row);
            foreach($subscribe_now_plan_data_arr as $subscribe_now_plan_data_row);
            $meal_type_id = $row->meal_type_id;
            $explode_data = explode(",",$meal_type_id);
            $meal_type_data = [];
            ?>
            <main>
                <div class="row contacts">
                    <div class="col invoice-to invoice_to">
                        <div class="text-gray-light">INVOICE TO:</div>
                        <h2 class="to"><?php echo $row->name ?? '' ?></h2>
                        <div class="address"><?php echo $row->address1 ?? '' ?></div>
                        <div class="email"><a href="mailto:test@example.com" style="color: #51d26c;text-decoration: none;"><?php echo $row->email ?? '' ?></a></div>
                    </div>
                    <div class="col invoice-details print_div">
                        <h3 class="invoice-id"><small style="font-size: 14px;">Subscribe Id - </small> <?php echo $row->subscription_id ?? '' ?></h3>
                        <div class="date">Date of Invoice: <?php echo strftime('%d-%m-%Y',strtotime($row->created_at)) ?? '' ?></div>
                        <div class="date">Start Date: <?php echo strftime('%d-%m-%Y',strtotime($row->start_date)) ?? '' ?></div>
                    </div>
                </div>
                <table cellpadding="0" cellspacing="0" style="width:100%" class="table_dd">
                    <thead>
                        <tr>
                            <th style="padding: 8px;background: #eee;font-size:18px" align="left">NO. OF DAYS</th>
                            <!-- <th class="text-left">NO. OF DAYS</th> -->
                            <th style="padding: 8px;background: #eee;font-size:18px;" align="left">MEAL PLAN</th>
                            <th style="padding: 8px;background: #eee;font-size:18px;" align="right">MEAL TYPE </th>
                            <th style="padding: 8px;background: #eee;font-size:18px;" align="right">TOTAL</th>
                        </tr>
                    </thead>
                    <tbody>
                        
                        <tr>
                            <td class="no" style="padding: 8px;"><?php if($subscribe_now_data_arr){ echo $subscribe_now_data_row->subscribe_now_duration;}else{ echo "0"; } ?> Days</td>
                            <!-- <td class="text-left"><h3>Description 1</h3>Testing Description 1</td> -->
                            <td class="unit" style="padding: 8px;"><?php if($subscribe_now_plan_data_arr){ echo $subscribe_now_plan_data_row->subscribe_now_plan_name;}else{ echo "-"; } ?></td>
                            <td align="right" class="tax" style="padding: 8px;"><?php 
                            
                            if($meal_type_id){
                             for($i=0;$i<count($explode_data); $i++){ 
                             $food_avoid_data = \DB::table('meal_type')->select('meal_type_name')->where('meal_type_id',$explode_data[$i])->get();
                            for($j=0;$j<count($food_avoid_data); $j++){
                            foreach($food_avoid_data as $food_avoid_row):
                             ?><span> <?php echo $food_avoid_row->meal_type_name;  ?></span><?php endforeach;
                             }
                              } 
                          }else{
                            echo "-";
                          }
                              ?></td>
                          
                            <td class="total" style="padding: 8px;font-weight:bold;font-size:16px" align="right">₹ <?php echo $row->total; ?></td>
                        </tr>
                        
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="1"></td>
                            <td colspan="2" align="right" style="padding: 8px;">GST 5%</td>
                            <td align="right" style="padding: 8px;">₹ <?php echo $calc_gst = $row->total * 5 / 100; ?></td>
                        </tr>
                        <tr>
                            <td colspan="1"></td>
                            <td colspan="2" align="right">GRAND TOTAL</td>
                            <td style="padding: 8px;" align="right">₹ <?php echo round($row->total + $calc_gst); ?></td>
                        </tr>
                    </tfoot>
                </table>
                <div class="thanks thanks_div" style="padding: 8px;font-size:25px;color:#51d26c">Thank you!</div>
                <div class="notices">
                    <!-- <div>NOTICE:</div> -->
                    <div class="notice" style="padding: 8px;">System Generated Invoice.</div>
                </div>
            </main>
            <footer>
                Invoice was generated on a computer and is valid without the signature and seal.
            </footer>
        </div>
        <div></div>
    </div>
</div>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.22/pdfmake.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js"></script>
@endsection