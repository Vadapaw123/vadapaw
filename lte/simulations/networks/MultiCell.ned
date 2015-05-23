// 
//                           SimuLTE
// Copyright (C) 2012 Antonio Virdis, Daniele Migliorini, Giovanni
// Accongiagioco, Generoso Pagano, Vincenzo Pii.
// 
// This file is part of a software released under the license included in file
// "license.pdf". This license can be also found at http://www.ltesimulator.com/
// The above file and the present reference are part of the software itself, 
// and cannot be removed from it.
// 
package lte.simulations.networks;

import inet.networklayer.autorouting.ipv4.IPv4NetworkConfigurator;
import inet.networklayer.ipv4.RoutingTableRecorder;
import inet.nodes.ethernet.Eth10M;
import inet.nodes.inet.Router;
import inet.nodes.inet.StandardHost;
import inet.world.radio.ChannelControl;
import lte.corenetwork.binder.LteBinder;
import lte.corenetwork.nodes.Ue;
import lte.corenetwork.nodes.eNodeB;
import lte.corenetwork.nodes.ExtCell;


network MultiCell
{
    parameters:
        int numExtCells = default(0);
        @display("i=block/network2;bgb=991,558;bgi=background/budapest");
    submodules:
        channelControl: ChannelControl {
            @display("p=50,25;is=s");
        }
        routingRecorder: RoutingTableRecorder {
            @display("p=50,75;is=s");
        }
        configurator: IPv4NetworkConfigurator {
            @display("p=50,125");
            config = xmldoc("multi.xml");
            dumpTopology = true;
        }
        binder: LteBinder {
            @display("p=50,175;is=s");
        }
        server: StandardHost {
            @display("p=212,118;is=n;i=device/server");
        }
        router1: Router {
            @display("p=327,74;i=device/smallrouter");
        }
        router2: Router {
            @display("p=622,47;i=device/smallrouter");
        }
        eNodeB1: eNodeB {
            @display("p=417,338;is=vl");
        }
        eNodeB2: eNodeB {
            @display("p=643,266;is=vl");
        }
        ue1: Ue {
            @display("p=355,358");
        }
        ue2: Ue {
            @display("p=355,436");
        }
        eNodeB3: eNodeB {
            @display("p=447,212;is=vl");
        }
        eNodeB4: eNodeB {
            @display("p=600,328;is=vl");
        }
        eNodeB5: eNodeB {
            @display("p=569,212;is=vl");
        }
        ue3: Ue {
            @display("p=318,212");
        }
        ue4: Ue {
            @display("p=634,436");
        }
        ue5: Ue {
            @display("p=697,370");
        }
        ue6: Ue {
            @display("p=758,397");
        }
        ue7: Ue {
            @display("p=455,319");
        }
        ue8: Ue {
            @display("p=540,298");
        }
        ue9: Ue {
            @display("p=503,266");
        }
        ue10: Ue {
            @display("p=447,467");
        }
        ue11: Ue {
            @display("p=492,407");
        }
        ue12: Ue {
            @display("p=534,441");
        }
        ue13: Ue {
            @display("p=534,358");
        }
        ue14: Ue {
            @display("p=432,266");
        }

        ue15: Ue {
            @display("p=410,428");
        }

    connections:
        server.pppg++ <--> Eth10M <--> router1.pppg++;
        router1.pppg++ <--> Eth10M <--> router2.pppg++;
        router1.pppg++ <--> Eth10M <--> eNodeB1.ppp;
        router2.pppg++ <--> Eth10M <--> eNodeB2.ppp;
        router2.pppg++ <--> Eth10M <--> eNodeB5.ppp;
        router2.pppg++ <--> Eth10M <--> eNodeB4.ppp;
        router1.pppg++ <--> Eth10M <--> eNodeB3.ppp;
}
