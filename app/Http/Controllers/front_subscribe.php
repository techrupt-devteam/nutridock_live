public function postPersonalDetails(Request $request)
    {
        $arr_rules['_token']         = "required";
        $arr_data['phone_no']   =   $request->input('phone_no', null);
        $arr_data['name']   =   $request->input('full_name', null);
        $arr_data['email']   =   $request->input('email', null);

        $subacribe_now_value     = \DB::table('subscribe_now')->where('phone_no',$arr_data['phone_no'])->where('name',$arr_data['name'])->where('email',$arr_data['email'])->get();

        $subacribe_now_data_exit = $subacribe_now_value->toArray();

        foreach($subacribe_now_data_exit as $row){
            $payment_status = $row->payment_status;
            $start_date = $row->start_date;
            $duration_plane_id = $row->subscribe_now_plan_duration_id;
        }
        

        $now_plan_duration     = \DB::table('subscribe_now_plan_duration')->where('subscribe_now_plan_duration_id',$duration_plane_id)->get();
        //$duration_value = '';
        foreach($now_plan_duration as $plan_row){
            $duration_value = $plan_row->subscribe_now_duration;
        }
        
        if($subacribe_now_data_exit){
            if($payment_status != 'Paid'){


                SubscribeNow::where('phone_no',$arr_data['phone_no'])->where('name',$arr_data['name'])->where('email',$arr_data['email'])->where('payment_status',' ')->delete();

                //SubscribeNow::where('phone_no',$arr_data['phone_no'])->where('name',$arr_data['name'])->where('email',$arr_data['email'])->update($arr_data);
                $avoid_or_dislike_food = $request->input('avoid_or_dislike_food_id'); 
                $address1_meal = $request->input('address1_meal');
                $address2_meal = $request->input('address2_meal');
                
                //print_r($address1_meal); die;
                if($avoid_or_dislike_food){
                    $avoid_or_dislike_food_value = implode(',',$avoid_or_dislike_food);    
                }else{
                    $avoid_or_dislike_food_value = '';
                }
                
              /*  if($address1_meal){
                    $address1_meal_value = implode(',',$address1_meal);    
                }else{
                    $address1_meal_value = '';
                }

                if($address2_meal){
                    $address2_meal_value = implode(',',$address2_meal);    
                }else{
                    $address2_meal_value = '';
                }
            */
            

                $original_date = $request->input('start_date',null);
                $start_date = strtotime($original_date);
                $new_date = date("Y-m-d", $start_date);
                $arr_data['session_id']   = Session::getId();

                $arr_data['age']   =   $request->input('age',null);
                $arr_data['gender']   =   $request->input('gender',null);
                $arr_data['weight']   =   $request->input('weight',null);
                $arr_data['height_in_feet']   = $request->input('height_in_feet',null);
                $arr_data['height_in_inches']   =   $request->input('height_in_inches',null);
                $arr_data['physical_activity_id']   =   $request->input('physical_activity_id',null);
                $arr_data['other_food']   =   $request->input('other_food');
                $arr_data['avoid_or_dislike_food_id'] = $avoid_or_dislike_food_value;
                $arr_data['total'] = $request->input('total');
                $arr_data['price'] = 1;
                $arr_data['discount'] = $request->input('discount');
                $arr_data['food_precautions']   = $request->input('food_precautions',null);
                $arr_data['lifestyle_disease']   = $request->input('lifestyle_disease',null);
                $arr_data['start_date']   =  $new_date;
                $arr_data['subscribe_now_plan_id']   = 1;
                $arr_data['subscribe_now_plan_duration_id']   = $request->input('subscribe_now_plan_duration_id',null);
                $arr_data['meal_type_id'] = $request->input('meal_type_id',null);
                $arr_data['address1_meal'] = $address1_meal;
                $arr_data['address2_meal'] = $address2_meal;
                $arr_data['approve_status'] = 'Disapprove';
                /*$arr_data['subscription_id']= "subs".date('my').'-100'. rand(1,99);*/
                $arr_data['subscription_id'] = '100'.rand(1,999);
                $arr_data['address1']   = $request->input('address1',null);
                $arr_data['pincode1']   = $request->input('pincode1',null);
                $arr_data['address2']   = $request->input('address2',null);
                $arr_data['pincode2']   = $request->input('pincode2',null);
           
                //$personal_data_status = SubscribeNow::where('phone_no',$arr_data['phone_no'])->where('name',$arr_data['name'])->where('email',$arr_data['email'])->update($arr_data);
                $personal_data_status = SubscribeNow::create($arr_data);
                $valu_data = [];
                $value = \DB::table('subscribe_now')->where('phone_no',$arr_data['phone_no'])->where('name',$arr_data['name'])->where('email',$arr_data['email'])->get();

                if(!empty($value))
                {
                    $valu_data = $value->toArray();
                }

                 if($valu_data){
                    foreach($valu_data as $row){
                        $price = $row->price;
                        $name = $row->name;
                        $email = $row->email;
                        $phone_no = $row->phone_no;
                        $address = $row->address1;
                        $pincode = $row->pincode1;
                        $id = $row->id;
                    }
                        $data['amount'] = $price;
                        $data['name'] = $name;
                        $data['email'] = $email;
                        $data['phone_no'] = $phone_no;
                        $data['address'] = $address;
                        $data['pincode'] = $pincode;
                        $data['id'] = $id;
                        echo json_encode($data);
                }
            }else{

                $todays_date = date_create();//'2021-02-01'
                $start_date_value = date_create($start_date);//'2020-12-30'
                $diff = date_diff($start_date_value,$todays_date);
                $date_diff =  $diff->format('%a');
                
                if($date_diff > $duration_value){

                $original_date = $request->input('start_date',null);
                $start_date = strtotime($original_date);
                $new_date = date("Y-m-d", $start_date);
                $arr_data['session_id']   = Session::getId();

                $arr_data['age']   =   $request->input('age',null);
                $arr_data['gender']   =   $request->input('gender',null);
                $arr_data['weight']   =   $request->input('weight',null);
                $arr_data['height_in_feet']   = $request->input('height_in_feet',null);
                $arr_data['height_in_inches']   =   $request->input('height_in_inches',null);
                $arr_data['physical_activity_id']   =   $request->input('physical_activity_id',null);
                $arr_data['other_food']   =   $request->input('other_food');
                $arr_data['avoid_or_dislike_food_id'] = $avoid_or_dislike_food_value;
                $arr_data['total'] = $request->input('total');
                $arr_data['price'] = $request->input('price');
                $arr_data['discount'] = $request->input('discount');
                $arr_data['food_precautions']   = $request->input('food_precautions',null);
                $arr_data['lifestyle_disease']   = $request->input('lifestyle_disease',null);
                $arr_data['start_date']   =  $new_date;
                $arr_data['subscribe_now_plan_id']   = 1;
                $arr_data['subscribe_now_plan_duration_id']   = $request->input('subscribe_now_plan_duration_id',null);
                
                $arr_data['meal_type_id'] = $request->input('meal_type_id',null);
                $arr_data['address1_meal'] = $address1_meal;
                $arr_data['address2_meal'] = $address2_meal;
                $arr_data['approve_status'] = 'Disapprove';
                /*$arr_data['subscription_id']= "subs".date('my').'-100'. rand(1,99);*/
                $arr_data['subscription_id'] = '100'.rand(1,999);
                
                $arr_data['address1']   = $request->input('address1',null);
                $arr_data['pincode1']   = $request->input('pincode1',null);
                $arr_data['address2']   = $request->input('address2',null);
                $arr_data['pincode2']   = $request->input('pincode2',null);

                $personal_data_status = SubscribeNow::where('phone_no',$arr_data['phone_no'])->where('name',$arr_data['name'])->where('email',$arr_data['email'])->update($arr_data);

                $valu_data = [];
                $value = \DB::table('subscribe_now')->where('phone_no',$arr_data['phone_no'])->where('name',$arr_data['name'])->where('email',$arr_data['email'])->get();

                if(!empty($value))
                {
                    $valu_data = $value->toArray();
                }

                 if($valu_data){
                    foreach($valu_data as $row){
                        $price = $row->price;
                        $name = $row->name;
                        $email = $row->email;
                        $phone_no = $row->phone_no;
                        $address = $row->address1;
                        $pincode = $row->pincode1;
                        $id = $row->id;
                    }
                        $data['amount'] = $price;
                        $data['name'] = $name;
                        $data['email'] = $email;
                        $data['phone_no'] = $phone_no;
                        $data['address'] = $address;
                        $data['pincode'] = $pincode;
                        $data['id'] = $id;
                        echo json_encode($data);
                }
                    
                }else{
                    $alreadyexits = "Your plane is already going.";
                    echo json_encode($alreadyexits);
                }
            }
            
        }
        Session::flash('success', 'You have successfully subscribed to the nutridock');
    }