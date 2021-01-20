 <!-- Footer -->
      <footer class="sticky-footer bg-white">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright &copy; <a href="www.techrupt.in">Techrupt </a> </span>
          </div>
        </div>
      </footer>
      <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="login.html">Logout</a>
        </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="{{url('')}}/public/backend/vendor/jquery/jquery.min.js"></script>
  <script src="{{url('')}}/public/backend/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="{{url('')}}/public/backend/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="{{url('')}}/public/backend/js/sb-admin-2.min.js"></script>

  <!-- Page level plugins -->
  <script src="{{url('')}}/public/backend/vendor/chart.js/Chart.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="{{url('')}}/public/backend/js/demo/chart-area-demo.js"></script>
  <script src="{{url('')}}/public/backend/js/demo/chart-pie-demo.js"></script>

  <!-- Page level plugins -->
  <script src="{{url('')}}/public/backend/vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="{{url('')}}/public/backend/vendor/datatables/dataTables.bootstrap4.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="{{url('')}}/public/backend/js/demo/datatables-demo.js"></script>

  <script src="{{url('')}}/public/backend/js/img-preview/img-preview.min.js"></script>
<!-- <script src="dist/img-preview/img-preview1.js"></script> -->

<script type="text/javascript">
    $(document).ready(function() {
      $.uploadPreview({
        input_field: "#image-upload",
        preview_box: "#image-preview",
        label_field: "#image-label"

      });
    });
</script>
<script>
$(document).ready(function(){
  $('[data-toggle="tooltip"]').tooltip();
});



$(function(){
    $("#addRows").click(function () {
        $("#maintable").append(" <tr>"+
                                "<td><input type='text' name='name[]' class='form-control'></td>"+
                                "<td><input type=/text' name='image[]' class='form-control'></td>"+
                            "</tr>")
    });
});



</script>

<script type="text/javascript">
function Validate() {
    //Regex for Valid Characters i.e. Alphabets, Numbers and Space.
    var regex = /^[A-Za-z0-9 ]+$/;
    //Validate TextBox value against the Regex.
    var isValid = regex.test(document.getElementById("txtName").value);
    if (!isValid) {
        $('#err_specialcharacter').html('Special characters does not allowed!');
        return false;
    } else {
      //alert(2);
      return true;
    } 
    //return isValid;
}
function printDiv() 
{

  var divToPrint = document.getElementById('DivIdToPrint');
    var htmlToPrint = '' +
        '<style type="text/css">' +
        'table th, table td {' +
        'border:1px solid #000;' +
        'padding;0.5em;' +
        '}'+
        'table{'+
         'width:100%;' +
         'margin-top: 20px;'+ 
        '}'+
        '.print_div{'+
        'text-align: right;'+
        'margin-top: -115px;'+
        '}'+
        '.invoice_to{'+
        'margin-top: 20px;'+
        '}'+
        '.thanks_div{'+
        'margin-top: 20px;'+
        '}'+
        '.company_details{'+
        'text-align: right;'+
        'margin-top: -100px;'+
        '}'+
        '.address{'+
        'width:50%;' +
        '}'+
        '</style>';
    htmlToPrint += divToPrint.outerHTML;
    newWin = window.open("Nutridock");
    newWin.document.write("<h3 align='center'>Print Page</h3>");
    newWin.document.write(htmlToPrint);
    newWin.print();
    newWin.close();

}
$("body").on("click", "#btnExport", function () {
html2canvas($('#DivIdToPrint')[0], {
    onrendered: function (canvas) {
        var data = canvas.toDataURL();
        var docDefinition = {
            content: [{
                image: data,
                width: 500
            }]
        };
        pdfMake.createPdf(docDefinition).download("customer-details.pdf");
    }
});
});
</script>
</body>

</html>