/*
 * Copyright (c) 2023, WSO2 LLC. (https://www.wso2.com/) All Rights Reserved.
 *
 * WSO2 LLC. licenses this file to you under the Apache License,
 * Version 2.0 (the "License"); you may not use this file except
 * in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied. See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

package main

import (
	"context"
	"errors"
	"fmt"
	"log"
	"net/http"
	"os"
	"os/signal"
	"strconv"
	"syscall"
	"time"
)

var payload string

func main() {

	// Read the payload length from the environment variable
	// If the environment variable is not set, use the default value 50
	payloadLengthStr := os.Getenv("PAYLOAD_LENGTH")
	payloadLength := 50
	if payloadLengthStr != "" {
		var err error
		payloadLength, err = strconv.Atoi(payloadLengthStr)
		if err != nil {
			log.Printf("Invalid PAYLOAD_LENGTH value: %s. Using default value 50.", payloadLengthStr)
			payloadLength = 50
		}
	}

	payload = generateString(payloadLength)

	serverMux := http.NewServeMux()
	serverMux.HandleFunc("/greeter/greet", greet)
	serverMux.HandleFunc("/greeter/greet/2", greet)
	serverMux.HandleFunc("/greeter/greet/3", greet)
	serverMux.HandleFunc("/greeter/greet/4", greet)
	serverMux.HandleFunc("/greeter/greet/5", greet)
	serverMux.HandleFunc("/greeter/greet/6", greet)
	serverMux.HandleFunc("/greeter/greet/7", greet)
	serverMux.HandleFunc("/greeter/greet/8", greet)
	serverMux.HandleFunc("/greeter/greet/9", greet)
	serverMux.HandleFunc("/greeter/greet/10", greet)

	serverPort := 9090
	server := http.Server{
		Addr:    fmt.Sprintf(":%d", serverPort),
		Handler: serverMux,
	}
	go func() {
		log.Printf("Starting HTTP Greeter on port %d\n", serverPort)
		if err := server.ListenAndServe(); !errors.Is(err, http.ErrServerClosed) {
			log.Fatalf("HTTP ListenAndServe error: %v", err)
		}
		log.Println("HTTP server stopped serving new requests.")
	}()

	stopCh := make(chan os.Signal, 1)
	signal.Notify(stopCh, syscall.SIGINT, syscall.SIGTERM)
	<-stopCh // Wait for shutdown signal

	shutdownCtx, cancel := context.WithTimeout(context.Background(), 10*time.Second)
	defer cancel()

	log.Println("Shutting down the server...")
	if err := server.Shutdown(shutdownCtx); err != nil {
		log.Fatalf("HTTP shutdown error: %v", err)
	}
	log.Println("Shutdown complete.")
}

func greet(w http.ResponseWriter, r *http.Request) {
	fmt.Fprint(w, payload)
}


func generateString(length int) string {
	result := ""
	for i := 0; i < length; i++ {
		result += "a" // replace "a" with the desired character
	}
	return result
}
