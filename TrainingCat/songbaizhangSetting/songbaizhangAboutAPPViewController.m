//
//  songbaizhangAboutAPPViewController.m
//  TrainingCat
//
//  Created by crespo on 2020/3/4.
//  Copyright © 2020 crespo. All rights reserved.
//

#import "songbaizhangAboutAPPViewController.h"

@interface songbaizhangAboutAPPViewController ()

@end

@implementation songbaizhangAboutAPPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
      self.navigationItem.title=@"关于";
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    
    UIImageView *bgImageView=[UIImageView new];
    [self.view addSubview:bgImageView];
    bgImageView.contentMode=UIViewContentModeScaleAspectFill;
    [bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view.mas_top).offset(120);
        make.size.mas_equalTo(60);
    }];
    bgImageView.image = [UIImage imageNamed:@"logo"];
    
    
    UITextView *label=[UITextView new];
       [self.view addSubview:label];
       label.font=[UIFont systemFontOfSize:14];
       label.textColor=ColorWithRGB(0x1296db);
       [label mas_makeConstraints:^(MASConstraintMaker *make) {
           make.top.equalTo(self.view.mas_top).offset(180);
           make.left.equalTo(self.view.mas_left).offset(20);
           make.right.equalTo(self.view.mas_right).offset(-20);
           make.bottom.equalTo(self.view.mas_bottom).offset(-20);
       }];
       label.text=@"在许多养猫的主人看来，猫咪就是自己手中的宝贝，平时吃都比自己吃得好。那么在许多主人的这种心理下，就会导致猫咪越来越肆无忌惮，最后成为一只更加傲娇的猫咪。这个时候就有一部分的猫咪主人会说，既然是宠物，就得给它训练。但平时的训练都会涉及一个问题，就是会有打骂的环节。可能主人并不愿意，但是这是必要的。其实我们只要用对了方法，这么打它，猫咪是不会记仇而且变得变得听话的。\n一、当场对它批评养猫的主人都喜欢别人夸自家猫咪乖巧，所以在外面玩耍的时候，即使猫咪犯了错误，猫咪主人也不会批评它。这其实是错误的做法哦，猫咪是要不断的纠正错误才能变得更好。当它做了错事以后，猫咪主人也不用大声责骂它。只用声音大一点，语气显得生气一些便行。因为猫咪根本不懂你说什么，但是它能感觉到你的情绪。这样它们就知道自己错了，后面不会再犯了。不过最好还是要在室内进行，因为嘈杂的环境会让猫咪更加不按，最后导致它们造成害怕的情绪就麻烦了。\n 二、要有耐心,对待猫咪的时候，最重要的就是要有耐心。相信绝大部分猫咪主人都能做到，毕竟吗，面对的是可爱的宠物。训练猫咪是不能够心急的，它们有着自己的学习方式。所以这段时期不仅是猫咪在学习，也是主人学习的时候。要了解猫咪最适合的训练方法，还有怎么样才能让它跟自己关系更好。这些都是作为主人，应该去了解的。它们是要陪伴你很长时间的，你也有很多机会去了解它们。\n三、放一些它们讨厌的东西无论猫咪主人怎么样说，怎么样去制止它做某件事情。最好的方法，还是用它讨厌的东西去对付它。比如猫咪上厕所的时候，它想从猫砂盆里出来，就在它周围铺满锡箔纸。因为它们很讨厌这个东西，所以多做几次便知道在哪上厕所了。当然能够尽量不打骂猫咪，就不要去打骂它们。因为傲娇的猫咪，确实是比较记仇的。对待猫咪的时候，最重要的就是要有耐心。相信绝大部分猫咪主人都能做到，毕竟吗，面对的是可爱的宠物。训练猫咪是不能够心急的，它们有着自己的学习方式。所以这段时期不仅是猫咪在学习，也是主人学习的时候。要了解猫咪最适合的训练方法，还有怎么样才能让它跟自己关系更好。这些都是作为主人，应该去了解的。它们是要陪伴你很长时间的，你也有很多机会去了解它们。\n\n不管怎么样，猫咪跟其它宠物是有很大的不同的。所以打骂这种方法虽然可行，但是一定要注意分寸。猫咪本来就是胆小的动物，如果主人们还不断的对它责骂，那么它们会抑郁的。所以最好的方法就是不断的纠正它的错误，让它知道该怎么去做正确的事情。本APP 帮助你更好的训练猫咪，给有需要的人训练自己的猫咪，让猫咪更听话 ";
    
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
