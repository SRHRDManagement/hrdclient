<jsp:include page="header.jsp"></jsp:include>
<link href="${pageContext.request.contextPath}/resources/static/css/classStyle.css" rel="stylesheet">
    <div class="content-page" ng-app="profileApp" ng-controller="profileCtr">
        <div class="content">
            <div class="container">
                <!-- ========== start body content ========== -->

                        <div class="row">
                            <div class="col-sm-5 col-md-4 col-lg-3">
                                <div class="profile-detail card-box">
                                    <div>
                                        <img src="${pageContext.request.contextPath}/resources/static/images/avatars/7fdf9dda-7605-447f-8ac5-5c49301fd0bc.jpg" class="img-circle" alt="profile-image">

                                        <ul class="list-inline status-list m-t-20">
                                            <li>
                                                <h3 class="text-primary m-b-5">PHA VANSA</h3>
                                                <p>4th generation, HRD</p>
                                            </li>
                                        </ul>

                                        <hr>
                                        <h4 class="text-uppercase font-600">Information</h4>
                                        <div class="text-left">
                                            <p class="text-muted font-13"><strong>Full Name :</strong> <span class="m-l-15">Pha Vansa</span></p>
                                            <p class="text-muted font-13"><strong>Gender :</strong> <span class="m-l-15">male</span></p>

                                            <p class="text-muted font-13"><strong>Mobile :</strong><span class="m-l-15">077 848 396</span></p>

                                            <p class="text-muted font-13"><strong>Email :</strong> <span class="m-l-15">vansa.std@gmail.com</span></p>

                                            <p class="text-muted font-13"><strong>Address :</strong> <span class="m-l-15">Battambang</span></p><hr>
                                            <p class="text-muted font-13"><strong>Father Name :</strong> <span class="m-l-15">Bean Sovan</span></p>
											<p class="text-muted font-13"><strong>Mother Name :</strong> <span class="m-l-15">San KimEng</span></p>
                                        </div>
                                    </div>

                                </div>
                            </div>


                            <div class="col-md-9">
                                <section id="cd-timeline" class="cd-container">
                                    <div class="cd-timeline-block">
                                        <div class="cd-timeline-img cd-success">
                                            <i class="fa fa-tag"></i>
                                        </div> <!-- cd-timeline-img -->

                                        <div class="cd-timeline-content">
                                            <h3>Now, result</h3>
                                            <p>Hello, all hrd students. Here is the result of monthly result.</p>
                                            <span class="cd-date">May 23</span>
                                        </div> <!-- cd-timeline-content -->
                                    </div> <!-- cd-timeline-block -->

                                    <div class="cd-timeline-block">
                                        <div class="cd-timeline-img cd-danger">
                                            <i class="fa fa-thumbs-up"></i>
                                        </div> <!-- cd-timeline-img -->

                                        <div class="cd-timeline-content">
                                            <h3>Sport Event - Rooy7</h3>
                                            <p>We are going to have a football match at Rooy7 on 2pm. Siem Reap class is going to play against Phnom Penh class and Kompong Som meet Battom Bong class.  </p>
                                            <button type="button" class="btn btn-primary btn-rounded waves-effect waves-light m-t-15">See more detail</button>
                                            
                                            <span class="cd-date">May 30</span>
                                        </div> <!-- cd-timeline-content -->
                                    </div> <!-- cd-timeline-block -->

                                    <div class="cd-timeline-block">
                                        <div class="cd-timeline-img cd-info">
                                            <i class="fa fa-star"></i>
                                        </div> <!-- cd-timeline-img -->

                                        <div class="cd-timeline-content">
                                            <h3>Final Presentation</h3>
                                            <p>Today is our final presentation of all the projects in at HRD. Presentation will start at 1:30pm AEU room 605 and all the group got 10 minutes for showing what they got.<a href="#">Read more</a></p>
                                            <span class="cd-date">Jun 05</span>
                                        </div> <!-- cd-timeline-content -->
                                    </div> <!-- cd-timeline-block -->

                                    <div class="cd-timeline-block">
                                        <div class="cd-timeline-img cd-pink">
                                            <i class="fa fa-image"></i>
                                        </div> <!-- cd-timeline-img -->

                                        <div class="cd-timeline-content">
                                            <h3>School Trip</h3>
                                            <p>On 3rd September we going to Kompot province and Kep's beach and please make sure you pay 25$ per each before 28th.</p>
                                            <img src="assets/images/small/img1.jpg" alt="">
                                            <span class="cd-date">Jun 14</span>
                                        </div> <!-- cd-timeline-content -->
                                    </div> <!-- cd-timeline-block -->

                                    <div class="cd-timeline-block">
                                        <div class="cd-timeline-img cd-warning">
                                            <i class="fa fa-pencil-square-o"></i>
                                        </div> <!-- cd-timeline-img -->

                                        <div class="cd-timeline-content">
                                            <h3>Timeline Event Five</h3>
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iusto, optio, dolorum provident rerum.</p>
                                            <button type="button" class="btn btn-primary btn-rounded waves-effect waves-light m-t-15">See more detail</button>
                                            <span class="cd-date">Jun 18</span>
                                        </div> <!-- cd-timeline-content -->
                                    </div> <!-- cd-timeline-block -->

                                    <div class="cd-timeline-block">
                                        <div class="cd-timeline-img cd-primary">
                                            <i class="fa fa-paperclip"></i>
                                        </div> <!-- cd-timeline-img -->

                                        <div class="cd-timeline-content">
                                            <h3>Timeline Event End</h3>
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Excepturi, obcaecati, quisquam id molestias eaque asperiores voluptatibus cupiditate error assumenda delectus odit similique earum voluptatem doloremque dolorem ipsam quae rerum quis. Odit, itaque, deserunt corporis vero ipsum nisi eius odio natus ullam provident pariatur temporibus quia eos repellat consequuntur perferendis enim amet quae quasi repudiandae sed quod veniam dolore possimus rem voluptatum eveniet eligendi quis fugiat aliquam sunt similique aut adipisci.</p>
                                            <span class="cd-date">Jun 30</span>
                                        </div> <!-- cd-timeline-content -->
                                    </div> <!-- cd-timeline-block -->
                                </section> <!-- cd-timeline -->
                            </div>
                          </div>
                <!-- ========== end body content ========== -->
            </div>
        </div>      
    </div>
</div>
<script src="${pageContext.request.contextPath}/resources/static/js/profileAngular.js"></script>
<jsp:include page="footer.jsp"></jsp:include>