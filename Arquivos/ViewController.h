//
//  ViewController.h
//  Arquivos
//
//  Created by Raffael Patrício de Souza on 31/08/13.
//  Copyright (c) 2013 raffaelps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic,retain)IBOutlet UILabel *label;
@property (nonatomic,retain)IBOutlet UIButton *botao;
@property (nonatomic,retain)IBOutlet UITextField *txt;

@end
