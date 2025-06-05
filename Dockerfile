FROM n8nio/n8n:latest

# Set environment variables
ENV NODE_ENV=production
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=$PORT
ENV N8N_PROTOCOL=https
ENV WEBHOOK_URL=https://$RAILWAY_STATIC_URL
ENV N8N_EDITOR_BASE_URL=https://$RAILWAY_STATIC_URL

# Create data directory
USER root
RUN mkdir -p /home/node/.n8n && chown -R node:node /home/node/.n8n
USER node

# Expose port
EXPOSE $PORT

# Start n8n
CMD ["n8n", "start"]
