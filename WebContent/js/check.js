 $(function (){
      $('#tabData :checkbox').each(function(index,obj) {
        if ($(this ).attr('id')!='checkall')
        {
            $(this).bind("click", function() {
                //判断是否以全选    
                  var flag=true;
                  $('#tabData :checkbox').each(function(index,obj) {
                        if ($(this ).attr('id')!='checkall')
                        {
                            if(!$(this).attr('checked')){
                                flag = false;
                                return;
                            }
                        }
                  });
                  if(flag){
                        $("#checkall").attr('checked',true);
                  } else {
                        $("#checkall").attr('checked',false);
                  }
            });
          }
       });  
        
      $('#checkall').click( function (){
          $(':checkbox').attr('checked',$('#checkall').attr('checked') );
      });
  });