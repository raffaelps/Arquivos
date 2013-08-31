//
//  ViewController.m
//  Arquivos
//
//  Created by Raffael Patrício de Souza on 31/08/13.
//  Copyright (c) 2013 raffaelps. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.txt.delegate = self;
    self.label.text = [self recuperaConteudoArquivo];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)gravar:(id)sender
{
    NSString *conteudo = [self.txt text];
    [self gravarArquivo:conteudo];
    self.label.text = [self recuperaConteudoArquivo];
}

- (NSString*)instanciarArquivo
{
    NSFileManager *filemgr  = [NSFileManager defaultManager];
    NSString *arquivo = @"myfile.txt";
    
    //Localiza no dominio todos os diretorios que a sua aplicação tem acesso
    //NSDocumentDirectory = tipo de diretorio de documento
    //NSUserDomainMask = dominio do seu usuario
    //YES = retorna sub-diretorios
    NSString *diretorioRoot = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    
    //Path do arquivo
    NSString *storePath = [diretorioRoot stringByAppendingPathComponent:arquivo];
    
    NSLog(storePath);
    
    if ([filemgr fileExistsAtPath:diretorioRoot])
    {
        NSLog(@"DiretorioRoot existe");
    }
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:storePath])
    {
        NSLog(@"Arquivo da aplicação existe");
    }
    else
    {
        //[filemgr createFileAtPath:storePath contents:nil attributes:nil];
        NSLog(@"Test 2");
    }
    
    return storePath;
    
}

- (void)gravarArquivo:(NSString*)conteudo
{
    NSString *storePath = [self instanciarArquivo];
    NSError *error = nil;
    
    //writeToFile = já cria o arquivo para você senão existir o arquivo, se existir sobrepõe
    //atomically = se for YES você grava no arquivo de configuração da aplicação
    //encoding = NSStringEncodingConversionAllowLossy (mais enxuto) mas pode dar erro em caracter especial
    //error = & é para passar por referencia, pois está dentro de um método então tem que ser por referência
    if (![conteudo writeToFile:storePath atomically:NO encoding:NSStringEncodingConversionAllowLossy error:&error])
    {
        NSLog(@"Erro na hora de salvar o arquivo %@",error);
    }
    else
    {
        NSLog(@"Salvo com sucesso");
    }
    
}

- (NSString*)recuperaConteudoArquivo
{
    NSString *storePath = [self instanciarArquivo];
    return [[NSString alloc] initWithContentsOfFile:storePath encoding:nil error:nil];
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    if (theTextField == self.txt) {
        [theTextField resignFirstResponder];
    }
    return YES;
}


@end
